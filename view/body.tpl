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
        <?php if ( ! $auth): ?>
        <div class="text-gray wp-background corners corners-8" style="width:500px; margin:0 auto; padding-top:30px;">
            <div class="page-layout">
                <div class="container">
                    <div class="layout-box w-100" id="login-form" style="<?php print ( ! $action || $action == 'login') ? 'display: block;': 'display: none;'?>">
                        <h4 class="a-center"><?php echo $tauth; ?></h4>
                        <div class="box content w-65" style="margin-left:125px;">
                            <form action="/index.php?a=login" method="post" accept-charset="utf-8" role="form" onsubmit="return validate_login_form();">
                                <fieldset>
                                    <div class="f-row">
                                        <label><?php echo $login; ?></label>
                                        <div class="f-inputs">
                                            <input type="text" name="login" value="<?php echo $plogin; ?>" id="login">
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $password; ?></label>
                                        <div class="f-inputs">
                                            <input type="password" name="password" value="" id="password">
                                        </div>
                                    </div>
                                </fieldset>
                                <div class="errors" id='login-login'>
                                    <?php if(isset($errors['login'])): ?>
                                    <ul>
                                        <?php foreach($errors['login'] as $error): ?>
                                        <li><?php echo $error; ?></li>
                                        <?php endforeach; ?>
                                    </ul>
                                    <?php endif; ?>
                                </div>
                                <div class="f-row f-actions">
                                    <div style="padding-left: 25px;">
                                        <input type="submit" name="" class="button" value="<?php echo $button_name; ?>"> | <a href="javascript:void(0);" id="show-registr-form"><?php echo $registration; ?></a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="layout-box w-100" id="registr-form" style="<?php echo ($action == 'reg') ? 'display: block;': 'display: none;'?>">
                        <h4 class="a-center"><?php echo $treg; ?></h4>
                        <div class="box content w-65" style="margin-left:125px;">
                            <form action="/index.php?a=reg" method="post" accept-charset="utf-8" role="form" enctype="multipart/form-data" onsubmit="return validate_reg_form();">
                                <fieldset>
                                    <div class="f-row">
                                        <label><?php echo $name; ?></label>
                                        <div class="f-inputs">
                                            <input type="text" name="name" value="<?php echo $pname; ?>" id="reg_name">
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $surname; ?></label>
                                        <div class="f-inputs">
                                            <input type="text" name="last_name" value="<?php echo $plast_name; ?>" id="reg_last_name">
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $birthday; ?></label>
                                        <div class="f-inputs">
                                            <select style="width: 60px;" name="day">
                                                <option selected="" value="">день</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
                                            </select>
                                            <select style="width: 70px;" class="fll months mt0 mb0 qc-select-month" name="month">
                                                <option selected="" value="">месяц</option><option value="1">Январь</option><option value="2">Февраль</option><option value="3">Март</option><option value="4">Апрель</option><option value="5">Май</option><option value="6">Июнь</option><option value="7">Июль</option><option value="8">Август</option><option value="9">Сентябрь</option><option value="10">Октябрь</option><option value="11">Ноябрь</option><option value="12">Декабрь</option>
                                            </select>
                                            <select style="width: 60px;" name="year">
                                                <option selected="" value="">год</option><option value="2014">2014</option><option value="2013">2013</option><option value="2012">2012</option><option value="2011">2011</option><option value="2010">2010</option><option value="2009">2009</option><option value="2008">2008</option><option value="2007">2007</option><option value="2006">2006</option><option value="2005">2005</option><option value="2004">2004</option><option value="2003">2003</option><option value="2002">2002</option><option value="2001">2001</option><option value="2000">2000</option><option value="1999">1999</option><option value="1998">1998</option><option value="1997">1997</option><option value="1996">1996</option><option value="1995">1995</option><option value="1994">1994</option><option value="1993">1993</option><option value="1992">1992</option><option value="1991">1991</option><option value="1990">1990</option><option value="1989">1989</option><option value="1988">1988</option><option value="1987">1987</option><option value="1986">1986</option><option value="1985">1985</option><option value="1984">1984</option><option value="1983">1983</option><option value="1982">1982</option><option value="1981">1981</option><option value="1980">1980</option><option value="1979">1979</option><option value="1978">1978</option><option value="1977">1977</option><option value="1976">1976</option><option value="1975">1975</option><option value="1974">1974</option><option value="1973">1973</option><option value="1972">1972</option><option value="1971">1971</option><option value="1970">1970</option><option value="1969">1969</option><option value="1968">1968</option><option value="1967">1967</option><option value="1966">1966</option><option value="1965">1965</option><option value="1964">1964</option><option value="1963">1963</option><option value="1962">1962</option><option value="1961">1961</option><option value="1960">1960</option><option value="1959">1959</option><option value="1958">1958</option><option value="1957">1957</option><option value="1956">1956</option><option value="1955">1955</option><option value="1954">1954</option><option value="1953">1953</option><option value="1952">1952</option><option value="1951">1951</option><option value="1950">1950</option><option value="1949">1949</option><option value="1948">1948</option><option value="1947">1947</option><option value="1946">1946</option><option value="1945">1945</option><option value="1944">1944</option><option value="1943">1943</option><option value="1942">1942</option><option value="1941">1941</option><option value="1940">1940</option><option value="1939">1939</option><option value="1938">1938</option><option value="1937">1937</option><option value="1936">1936</option><option value="1935">1935</option><option value="1934">1934</option><option value="1933">1933</option><option value="1932">1932</option><option value="1931">1931</option><option value="1930">1930</option><option value="1929">1929</option><option value="1928">1928</option><option value="1927">1927</option><option value="1926">1926</option><option value="1925">1925</option><option value="1924">1924</option><option value="1923">1923</option><option value="1922">1922</option><option value="1921">1921</option><option value="1920">1920</option><option value="1919">1919</option><option value="1918">1918</option><option value="1917">1917</option><option value="1916">1916</option><option value="1915">1915</option><option value="1914">1914</option><option value="1913">1913</option><option value="1912">1912</option><option value="1911">1911</option><option value="1910">1910</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $city; ?></label>
                                        <div class="f-inputs">
                                            <input type="text" name="city" value="<?php echo $pcity; ?>" id="reg_city">
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $gender; ?></label>
                                        <div class="f-inputs">
                                            <input id="man1" type="radio" value="1" name="man">
                                            <span> <?php echo $man; ?> </span>
                                            <input id="man2" type="radio" value="2" name="man">
                                            <span> <?php echo $woman; ?> </span>
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $mail; ?></label>
                                        <div class="f-inputs">
                                            <input type="text" name="mail" value="<?php echo $pmail; ?>" id="reg_mail">
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $phone; ?></label>
                                        <div class="f-inputs">
                                            <input type="text" name="phone" value="<?php echo $pphone; ?>" id="reg_phone">
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $login; ?></label>
                                        <div class="f-inputs">
                                            <input type="text" name="login" value="<?php echo $plogin; ?>" id="reg_login">
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $password; ?></label>
                                        <div class="f-inputs">
                                            <input type="password" name="password" value="" id="reg_pass">
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $conf_password; ?></label>
                                        <div class="f-inputs">
                                            <input type="password" name="confirm_password" value="" id="reg_conf_pass">
                                        </div>
                                    </div>
                                    <div class="f-row">
                                        <label><?php echo $avatar; ?></label>
                                        <div class="f-inputs">
                                            <input type="file" name="avatar" value="" id="reg_avatar">
                                        </div>
                                    </div>
                                </fieldset>
                                <div class="errors" id='login-reg'>
                                    <?php if(isset($errors['reg'])): ?>
                                    <ul>
                                        <?php foreach($errors['reg'] as $error): ?>
                                        <li><?php echo $error; ?></li>
                                        <?php endforeach; ?>
                                    </ul>
                                    <?php endif; ?>
                                </div>
                                <div class="f-row f-actions">
                                    <div style="padding-left: 25px;">
                                        <input type="submit" name="" class="button" value="<?php echo $button_name; ?>"> | <a href="javascript:void(0);" id="show-login-form"><?php echo $authorization; ?></a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
                <em class="bl"></em>
                <em class="br"></em>
            </div>
        </div>
        <?php else: ?>
        <div class="text-gray wp-background corners corners-8" style="width:500px; margin:0 auto; padding-top:30px;">
            <div class="user-info">
                <table>
                    <thead>
                        <tr>
                            <th colspan="2"><?php echo $user_info; ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><?php echo $login; ?></td>
                            <td><?php print $user['login']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo $avatar; ?></td>
                            <td><img src="images/<?php print $user['avatar']; ?>" alt="" width="150"></td>
                        </tr>
                        <tr>
                            <td><?php echo $name; ?></td>
                            <td><?php print $user['name']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo $surname; ?></td>
                            <td><?php print $user['last_name']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo $birthday; ?></td>
                            <td><?php print date('d.m.Y', strtotime($user['date'])); ?></td>
                        </tr>
                        <tr>
                            <td><?php echo $city; ?></td>
                            <td><?php print $user['city']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo $mail; ?></td>
                            <td><?php print $user['mail']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo $phone; ?></td>
                            <td><?php print $user['phone']; ?></td>
                        </tr>
                        <tr>
                            <td><?php echo $gender; ?></td>
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
        </div>
        <?php endif; ?>
    </body>
    <script type="text/javascript">
        function validate_login_form()
        {
            var login = document.getElementById('login').value;
            var password = document.getElementById('password').value;
            var counter = 0;
            
            var div = document.getElementById('login-login');
            div.innerHTML = '';
            
            if (login.length < 1){
                div.innerHTML += '<li><?php echo $error_login; ?></li>';
                counter++;
            }

            if (password.length < 1){
                div.innerHTML += '<li><?php echo $error_password; ?></li>';
                counter++;
            }

            if (counter > 0)
                return false;
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

            var div = document.getElementById('login-reg');
            div.innerHTML = '';

            if (name.length < 1 || name.length > 32){
                div.innerHTML += '<li><?php echo $error_firstname; ?></li>';
            }

            if (last.length < 1 || last.length > 32){
                div.innerHTML += '<li><?php echo $error_firstname; ?></li>';
                counter++;
            }
            
            if( ! mail.match(/^[-._a-z0-9]+@(?:[a-z0-9][-a-z0-9]+\.)+[a-z]{2,6}$/gi)){
                div.innerHTML += '<li><?php echo $error_email; ?></li>';
                counter++;
            }

            if(phone.length < 10 || phone.length > 32 || !phone.match(/^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$/gi)){
                div.innerHTML += '<li><?php echo $error_telephone; ?></li>';
                counter++;
            }

            if (login.length < 1){
                div.innerHTML += '<li><?php echo $error_reg_login; ?></li>';
                counter++;
            }

            if(password.length < 2 || password.length > 20){
                div.innerHTML += '<li><?php echo $error_password; ?></li>';
                counter++;
            }

            if( password !== password_conf ){
                div.innerHTML += '<li><?php echo $error_confirm; ?></li>';
                counter++;
            }

            if (avatar.length > 0){
                var search = avatar.search(/^.*\.(?:gif|jpg|png)\s*$/ig);

                if(search !== 0){
                    div.innerHTML += '<li><?php echo $error_file_type; ?></li>';
                    counter++;
                }
            }

            if (counter > 0)
                return false;
            else
                return true;
        }
    </script>
</html>