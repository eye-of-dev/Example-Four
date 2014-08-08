<?php

defined('EXAMPLE') or die('Access denied');

class ModelAuthorization extends Model
{

    // Заводим некоторые переменные для удобства дальннейшего использования
    private $cookieTIME = 2678400;
    private $nameSUID = 'USER_SUID';
    private $nameUID = 'USER_UID';
    // Профиль текущего пользователя
    public $profile = NULL;

    public function check()
    {
        
        // Получаем уникальные идентификаторы пользователя из cookies
        $cookieSUID = isset($this->request->cookie[$this->nameSUID]) ? $this->request->cookie[$this->nameSUID] : FALSE;
        $userID = isset($this->request->cookie[$this->nameUID]) ? $this->request->cookie[$this->nameUID] : FALSE;

        // Если нет куки
        if ($cookieSUID === FALSE && $userID === FALSE)
        {
            return $this->logout();
        }

        // Пытаемся получить пользователя
        $query = $this->db->query("SELECT * FROM `users` WHERE `id`='" . $userID . "'");
        
        // Если пользователь нe найден
        if ($query->num_rows === 0)
        {
            return $this->logout();
        }

        $this->profile = $query->row;

        // Если хеш не входит в массив записанных в базе - редиректим
        if (!isset($this->profile['sid']) && $this->profile['sid'] != $cookieSUID)
        {
            return $this->logout();
        }
        else
        {
            return TRUE;
        }
    }

    public function login()
    {
        $login = isset($this->request->post['login']) ? $this->request->post['login'] : FALSE;
        $password = isset($this->request->post['password']) ? $this->request->post['password'] : FALSE;

        if ($password && $login)
        {
            // Пытаемся получить пользователя
            $query = $this->db->query("SELECT * FROM `users` WHERE `login`='" . $login . "' AND `password`='" . md5($password) . "'");
            $this->profile = $query->row;
            
            if ($this->profile)
            {
                // Генерируем SUID и записываем его в Cookies
                $SUID = md5($this->profile['login'] . uniqid(rand(), 1));
                
                $this->db->query("UPDATE `users` SET `sid`='" . $SUID . "' WHERE `id`='" . $this->profile['id'] . "'");
                
                // Добавляем куки
                setcookie($this->nameSUID, $SUID, time() + $this->cookieTIME);
                setcookie($this->nameUID, $this->profile['id'], time() + $this->cookieTIME);

                return TRUE;
            }
        }
        
        return FALSE;
    }

    public function logout()
    {
        setcookie($this->nameSUID, '', 0);
        setcookie($this->nameUID, '', 0);
        
        return FALSE;
    }

}
