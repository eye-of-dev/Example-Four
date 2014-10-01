<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        
        <link rel="stylesheet" type="text/css" href="css/main.css" />
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" defer="defer"></script>
        <script src="js/scripts.js" defer="defer"></script>
    </head>
    <body>
        <div class="wrapper">
            <?php if(isset($errors) && !empty($errors)): ?>
            <div id="notification" style="display: block;">
                <?php foreach($errors as $error): ?>
                <div class="errors"><?php echo $error; ?></div>
                <?php endforeach; ?>
                <a href="javascript:void(0)" title="Close" onclick="hide_block();"><img src="/css/images/close.png" alt="close" id="close"></a>
            </div>
            <?php else: ?>
            <div id="notification" style="display: none;"></div>
            <?php endif; ?>
            <div id="main">
                <h2><?php echo $title; ?></h2>
                <?php if ( ! $auth): ?>
                <div class="forms">
                    <div id="login-form" style="<?php echo ( ! $action || $action == 'login') ? 'display: block;': 'display: none;'?>">
                        <h4><?php echo $text_auth; ?></h4>
                        <form action="/index.php?a=login" method="post" accept-charset="utf-8" onsubmit="return validate_login_form();">
                            <p>
                                <input type="text" name="login" value="" placeholder="<?php echo $login; ?>" id="login">
                            </p>
                            <p>
                                <input type="password" name="password" value="" placeholder="<?php echo $password; ?>" id="password">
                            </p>
                            <p class="buttons">
                                <input type="submit" name="submit" value="<?php echo $button_name; ?>"  /> | <a href="javascript:void(0);" id="show-registr-form"><?php echo $registration; ?></a>
                            </p>
                        </form>
                    </div>
                    <div id="registr-form" style="<?php echo ($action == 'reg') ? 'display: block;': 'display: none;'?>">
                        <h4><?php echo $text_reg; ?></h4>
                        <form action="/index.php?a=reg" method="post" accept-charset="utf-8" role="form" enctype="multipart/form-data" onsubmit="return validate_reg_form();">
                            <p>
                                <input type="text" name="name" value="" id="reg_name" placeholder="<?php echo $name; ?>">
                            </p>
                            <p>
                                <input type="text" name="last_name" value="" id="reg_last_name" placeholder="<?php echo $surname; ?>">
                            </p>
                            <p>
                                <span><?php echo $birthday; ?></span>
                                <select name="day" style="width: 100px;">
                                    <option selected="" value="">день</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
                                </select>
                                <select name="month" style="width: 135px;">
                                    <option selected="" value="">месяц</option><option value="1">Январь</option><option value="2">Февраль</option><option value="3">Март</option><option value="4">Апрель</option><option value="5">Май</option><option value="6">Июнь</option><option value="7">Июль</option><option value="8">Август</option><option value="9">Сентябрь</option><option value="10">Октябрь</option><option value="11">Ноябрь</option><option value="12">Декабрь</option>
                                </select>
                                <select name="year" style="width: 100px;">
                                    <option selected="" value="">год</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option>
                                </select>
                            </p>
                            <p>
                                <input type="text" name="city" value="" id="reg_city" placeholder="<?php echo $city; ?>">
                            </p>
                            <p>
                                <span><?php echo $gender; ?></span>
                                <label for="gender_man"><?php echo $man; ?></label><input id="gender_man" type="radio" value="1" name="man">
                                <label for="gender_woman"><?php echo $woman; ?></label><input id="gender_woman" type="radio" value="2" name="man">
                            </p>
                            <p>
                                <input type="text" name="mail" value="" id="reg_mail" placeholder="<?php echo $mail; ?>">
                            </p>
                            <p>
                                <input type="text" name="phone" value="" id="reg_phone" placeholder="<?php echo $phone; ?>">
                            </p>
                            <p>
                                <input type="text" name="login" value="" id="reg_login" placeholder="<?php echo $login; ?>">
                            </p>
                            <p>
                                <input type="password" name="password" value="" id="reg_pass" placeholder="<?php echo $password; ?>">
                            </p>
                            <p>
                                <input type="password" name="confirm_password" value="" id="reg_conf_pass" placeholder="<?php echo $conf_password; ?>">
                            </p>
                            <p>
                                <span><?php echo $avatar; ?></span>
                                <input type="file" name="avatar" value="" id="reg_avatar">
                            </p>
                            <p>
                                <input type="submit" name="" value="<?php echo $button_name; ?>"> | <a href="javascript:void(0);" id="show-login-form"><?php echo $authorization; ?></a>
                            </p>
                        </form>
                    </div>
                </div>
                <?php else: ?>
                <div class="user-info">
                    <table>
                        <thead>
                            <tr>
                                <th colspan="2"><?php echo $user_info; ?></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="label"><?php echo $login; ?></td>
                                <td><?php print $user['login']; ?></td>
                            </tr>
                            <tr>
                                <td class="label"><?php echo $avatar; ?></td>
                                <td>
                                    <?php if($user['avatar']) :?>
                                    <img src="images/<?php print $user['avatar']; ?>" alt="" width="150">
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <tr>
                                <td class="label"><?php echo $name; ?></td>
                                <td><?php print $user['name']; ?></td>
                            </tr>
                            <tr>
                                <td class="label"><?php echo $surname; ?></td>
                                <td><?php print $user['last_name']; ?></td>
                            </tr>
                            <tr>
                                <td class="label"><?php echo $birthday; ?></td>
                                <td><?php print date('d.m.Y', strtotime($user['date'])); ?></td>
                            </tr>
                            <tr>
                                <td class="label"><?php echo $city; ?></td>
                                <td><?php print $user['city']; ?></td>
                            </tr>
                            <tr>
                                <td class="label"><?php echo $mail; ?></td>
                                <td><?php print $user['mail']; ?></td>
                            </tr>
                            <tr>
                                <td class="label"><?php echo $phone; ?></td>
                                <td><?php print $user['phone']; ?></td>
                            </tr>
                            <tr>
                                <td class="label"><?php echo $gender; ?></td>
                                <td><?php print ($user['gender'] == 1) ? $man : $woman; ?></td>
                            </tr>
                        </tbody>
                        <thead>
                            <tr>
                                <th colspan="2"><a href="/index.php?a=logout"><?php echo $logout; ?></a></th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <?php endif; ?>
            </div>
        </div>
    </body>
    <script type="text/javascript">

        function hide_block()
        {
            document.getElementById('notification').style.display = 'none';
        }

        function validate_login_form()
        {
            var login = document.getElementById('login').value;
            var password = document.getElementById('password').value;
            var counter = 0;

            var div = document.getElementById('notification');
            div.innerHTML = '';

            if (login.length < 1){
                div.innerHTML += '<div class="errors"><?php echo $error_login; ?></div>';
                counter++;
            }

            if (password.length < 1){
                div.innerHTML += '<div class="errors"><?php echo $error_password; ?></div>';
                counter++;
            }

            if (counter > 0){
                div.innerHTML += '<a href="javascript:void(0)" title="Close" onclick="hide_block();"><img src="/css/images/close.png" alt="close" id="close"></a>';
                div.style.display = 'block';
                return false;
            }
            else
                return true;    
        }
        
        function validate_reg_form()
        {
            var name = document.getElementById('reg_name').value;
            var last = document.getElementById('reg_last_name').value;
            var mail = document.getElementById('reg_mail').value;
            var phone = document.getElementById('reg_phone').value;
            var login = document.getElementById('reg_login').value;
            var password = document.getElementById('reg_pass').value;
            var password_conf = document.getElementById('reg_conf_pass').value;
            var avatar = document.getElementById('reg_avatar').value;

            var counter = 0;

            var div = document.getElementById('notification');
            div.innerHTML = '';

            if (name.length < 1 || name.length > 32){
                div.innerHTML += '<div class="errors"><?php echo $error_firstname; ?></div>';
            }

            if (last.length < 1 || last.length > 32){
                div.innerHTML += '<div class="errors"><?php echo $error_lastname; ?></div>';
                counter++;
            }
            
            if( ! mail.match(/^[-._a-z0-9]+@(?:[a-z0-9][-a-z0-9]+\.)+[a-z]{2,6}$/gi)){
                div.innerHTML += '<div class="errors"><?php echo $error_email; ?></div>';
                counter++;
            }

            if(phone.length < 10 || phone.length > 32 || !phone.match(/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/gi)){
                div.innerHTML += '<div class="errors"><?php echo $error_telephone; ?></div>';
                counter++;
            }

            if (login.length < 1){
                div.innerHTML += '<div class="errors"><?php echo $error_reg_login; ?></div>';
                counter++;
            }

            if(password.length < 2 || password.length > 20){
                div.innerHTML += '<div class="errors"><?php echo $error_password; ?></div>';
                counter++;
            }

            if( password !== password_conf ){
                div.innerHTML += '<div class="errors"><?php echo $error_confirm; ?></div>';
                counter++;
            }

            if (avatar.length > 0){
                var search = avatar.search(/^.*\.(?:gif|jpg|png)\s*$/ig);

                if(search !== 0){
                    div.innerHTML += '<div class="errors"><?php echo $error_file_type; ?></div>';
                    counter++;
                }
            }

            if (counter > 0){
                div.innerHTML += '<a href="javascript:void(0)" title="Close" onclick="hide_block();"><img src="/css/images/close.png" alt="close" id="close"></a>';
                div.style.display = 'block';
                return false;
            }
            else
                return true;
        }
        
    </script>
</html>