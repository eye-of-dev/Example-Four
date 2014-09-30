<?php

defined('EXAMPLE') or die('Access denied');

/**
 * Description of body
 */
class Main extends Controller
{

    private $errors = array();

    public function __construct($registry)
    {
        parent::__construct($registry);

        $this->load->model('user');

        $this->load->model('authorization');

        $lang = substr($this->request->server['HTTP_ACCEPT_LANGUAGE'], 0, 2);
        
        $this->language->load($lang);
    }

    /**
     * Точка входа и главный обработчик
     * @return void
     */
    public function index()
    {
        // lang
        $this->data['title'] = $this->language->get('title');
        $this->data['text_auth'] = $this->language->get('text_auth');
        $this->data['login'] = $this->language->get('login');
        $this->data['password'] = $this->language->get('password');
        $this->data['conf_password'] = $this->language->get('conf_password');
        $this->data['button_name'] = $this->language->get('button_name');
        $this->data['registration'] = $this->language->get('registration');

        $this->data['text_reg'] = $this->language->get('text_reg');
        $this->data['name'] = $this->language->get('name');
        $this->data['surname'] = $this->language->get('surname');
        $this->data['birthday'] = $this->language->get('birthday');
        $this->data['city'] = $this->language->get('city');
        $this->data['gender'] = $this->language->get('gender');
        $this->data['man'] = $this->language->get('man');
        $this->data['woman'] = $this->language->get('woman');
        $this->data['mail'] = $this->language->get('mail');
        $this->data['phone'] = $this->language->get('phone');
        $this->data['phone'] = $this->language->get('phone');
        $this->data['avatar'] = $this->language->get('avatar');
        $this->data['authorization'] = $this->language->get('authorization');

        $this->data['user_info'] = $this->language->get('user_info');
        $this->data['logout'] = $this->language->get('logout');

        $this->data['base'] = $_SERVER['SERVER_NAME'];

        $this->data['action'] = isset($this->request->get['a']) ? $this->request->get['a'] : '';

        if ($this->data['action'] == 'logout')
        {
            $this->model_authorization->logout();
            header('Location: /');
            exit;
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm($this->data['action']))
        {

            if ($this->data['action'] == 'reg')
            {
                $this->model_user->registration();
            }

            $this->model_authorization->login();
            header('Location: /');
            exit;
        }

        // Post Data
        if (isset($this->request->post['login'])){
            $this->data['plogin'] = $this->request->post['login'];
        }else{
            $this->data['plogin'] = '';
        }
        
        if (isset($this->request->post['name'])){
            $this->data['pname'] = $this->request->post['name'];
        }else{
            $this->data['pname'] = '';
        }
        
        if (isset($this->request->post['last_name'])){
            $this->data['plast_name'] = $this->request->post['last_name'];
        }else{
            $this->data['plast_name'] = '';
        }
        
        if (isset($this->request->post['city'])){
            $this->data['pcity'] = $this->request->post['city'];
        }else{
            $this->data['pcity'] = '';
        }
        
        if (isset($this->request->post['mail'])){
            $this->data['pmail'] = $this->request->post['mail'];
        }else{
            $this->data['pmail'] = '';
        }
        
        if (isset($this->request->post['phone'])){
            $this->data['pphone'] = $this->request->post['phone'];
        }else{
            $this->data['pphone'] = '';
        }
        
        // Errors var.
        $this->data['error_login'] = $this->language->get('error_login');
        $this->data['error_password'] = $this->language->get('error_password');

        $this->data['error_firstname'] = $this->language->get('error_firstname');
        $this->data['error_lastname'] = $this->language->get('error_lastname');
        $this->data['error_email'] = $this->language->get('error_email');
        $this->data['error_telephone'] = $this->language->get('error_telephone');
        $this->data['error_password'] = $this->language->get('error_password');
        $this->data['error_confirm'] = $this->language->get('error_confirm');
        $this->data['error_file_type'] = $this->language->get('error_file_type');
        $this->data['error_reg_login'] = $this->language->get('error_reg_login');

        $this->data['errors'] = $this->errors;

        $this->data['auth'] = $this->model_authorization->check();

        if (isset($this->request->cookie['USER_UID']))
        {
            $this->data['user'] = $this->model_user->getUser($this->request->cookie['USER_UID']);
        }

        $this->template = 'main.tpl';
        print $this->render();
    }

    /**
     * Функция валидации формы
     * @param string $form Action
     * @return boolean
     */
    private function validateForm($form)
    {

        if ($form === 'login')
        {
            if ((mb_strlen($this->request->post['login']) < 1) || (mb_strlen($this->request->post['login']) > 32))
            {
                $this->errors['login']['login'] = $this->language->get('error_login');
            }

            if ((mb_strlen($this->request->post['password']) < 1) || (mb_strlen($this->request->post['password']) > 20))
            {
                $this->errors['login']['password'] = $this->language->get('error_password');
            }
        }
        elseif ($form === 'reg')
        {
            if ((mb_strlen($this->request->post['name']) < 1) || (mb_strlen($this->request->post['name']) > 32))
            {
                $this->errors['reg']['error_firstname'] = $this->language->get('error_firstname');
            }

            if ((mb_strlen($this->request->post['last_name']) < 1) || (mb_strlen($this->request->post['last_name']) > 32))
            {
                $this->errors['reg']['error_lastname'] = $this->language->get('error_lastname');
            }

            if ((mb_strlen($this->request->post['mail']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['mail']))
            {
                $this->errors['reg']['error_email'] = $this->language->get('error_email');
            }

            if ((mb_strlen($this->request->post['phone']) < 10) || (mb_strlen($this->request->post['phone']) > 32))
            {
                $this->errors['reg']['error_telephone'] = $this->language->get('error_telephone');
            }

            if ($this->model_user->getUserByLogin($this->request->post['login']))
            {
                $this->errors['reg']['error_login_exist'] = $this->language->get('error_login_exist');
            }

            if ((mb_strlen($this->request->post['login']) < 1) || (mb_strlen($this->request->post['login']) > 32))
            {
                $this->errors['reg']['error_login'] = $this->language->get('error_login');
            }

            if ((mb_strlen($this->request->post['password']) < 3) || (mb_strlen($this->request->post['password']) > 20))
            {
                $this->errors['reg']['error_password'] = $this->language->get('error_password');
            }

            if ($this->request->post['confirm_password'] != $this->request->post['password'])
            {
                $this->errors['reg']['error_confirm'] = $this->language->get('error_confirm');
            }

            if (isset($this->request->files['avatar']) && $this->request->files['avatar']['tmp_name'])
            {
                $filename = basename(html_entity_decode($this->request->files['avatar']['name'], ENT_QUOTES, 'UTF-8'));

                if ((mb_strlen($filename) < 3) || (mb_strlen($filename) > 255))
                {
                    $this->errors['reg']['error_filename'] = $this->language->get('error_filename');
                }

                if ($this->request->files['avatar']['size'] > 300000)
                {
                    $this->errors['reg']['error_file_size'] = $this->language->get('error_file_size');
                }

                $allowed = array(
                    'image/jpeg',
                    'image/pjpeg',
                    'image/png',
                    'image/x-png',
                    'image/gif'
                );

                if (!in_array($this->request->files['avatar']['type'], $allowed))
                {
                    $this->errors['reg']['error_file_type'] = $this->language->get('error_file_type');
                }

                $allowed = array(
                    '.jpg',
                    '.jpeg',
                    '.gif',
                    '.png'
                );

                if (!in_array(strtolower(strrchr($filename, '.')), $allowed))
                {
                    $this->errors['reg']['error_file_type'] = $this->language->get('error_file_type');
                }

                $content = file_get_contents($this->request->files['avatar']['tmp_name']);

                if (preg_match('/\<\?php/i', $content))
                {
                    $this->errors['reg']['error_file_type'] = $this->language->get('error_file_type');
                }

                if ($this->request->files['avatar']['error'] != UPLOAD_ERR_OK)
                {
                    $this->errors['reg']['error_file_type'] = $this->language->get('error_file_type');
                }
            }
        }

        if (!$this->errors)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}
