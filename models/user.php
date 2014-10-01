<?php defined('EXAMPLE') or die('Access denied');

class ModelUser extends Model
{
    /**
     * Регистрация нового пользователя
     * Предпологается, что сюда дошли только вылидные данные.
     */
    public function registration()
    {
        $date = date('Y-m-d H:i:s', strtotime($this->request->post['day'] . '-' . $this->request->post['month'] . '-' . $this->request->post['year']));
        
        $sql = "INSERT INTO `users` SET "
                . "`login` = '" . $this->request->post['login'] . "', "
                . "`password`='" . md5($this->request->post['password']) . "'," // Да, да знаю что надо использовать password_hash()
                . "`name`='" . $this->db->escape($this->request->post['name']) . "', "
                . "`last_name`='" . $this->db->escape($this->request->post['last_name']) . "', "
                . "`date`='" . $date . "', "
                . "`city`='" . $this->db->escape($this->request->post['city']) . "', "
                . "`gender`='" . (int) $this->request->post['man'] . "', "
                . "`mail`='" . $this->db->escape($this->request->post['mail']) . "', "
                . "`phone`='" . $this->db->escape($this->request->post['phone']) . "'"; 
        
        $this->db->query($sql);
        
        $user_id = $this->db->getLastId();
        
        $filename = '';
        if (isset($this->request->files['avatar']) && $this->request->files['avatar']['tmp_name']){
            $filename = basename(html_entity_decode($this->request->files['avatar']['name'], ENT_QUOTES, 'UTF-8'));
            
            if ( ! file_exists(DIR_IMAGES . 'avatars/'))
            {
                mkdir(DIR_IMAGES . 'avatars/');
            }
            
            if ( ! file_exists(DIR_IMAGES . 'avatars/' . $user_id . '/')){
                mkdir(DIR_IMAGES . 'avatars/' . $user_id . '/', 0777);
            }

            move_uploaded_file($this->request->files['avatar']['tmp_name'], DIR_IMAGES . 'avatars/' . $user_id . '/' . $filename);
            $filename = 'avatars/' . $user_id . '/' . $filename;
            
            $this->db->query("UPDATE `users` SET `avatar`='" . $filename . "' WHERE `id`='" . $user_id . "'");
        }
        
    }
 
    /**
     * Получение данных пользователя по его идентификатору
     * @param int $user_id Идентификатор пользователя
     * @return array Данные пользователя
     */
    public function getUser($user_id){
        
        $sql = "SELECT u.* FROM `users` u WHERE u.`id` = '" . $user_id . "';";
        
        $result = $this->db->query($sql);
        
        return $result->row;
    }
    
    /**
     * Получение данных пользователя по его логину
     * @param string $login Логин пользователя
     * @return array Данные пользователя
     */
    public function getUserByLogin($login){
        
        $sql = "SELECT * FROM `users` WHERE users.login='" . $this->db->escape($login) . "'";
        
        $result = $this->db->query($sql);
        
        return $result->row;
    }
}
