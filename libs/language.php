<?php
class Language {
	private $directory; // Язык по умолчанию
	private $data = array();

	public function __construct($directory) {
		$this->directory = $directory;
	}

	public function get($key) {
		return (isset($this->data[$key]) ? $this->data[$key] : $key);
	}

	public function load($lang) {
		$file = DIR_LANG . $lang . '/main.php';

		if (file_exists($file)) {
                    
			$_ = array();

			require($file);

			$this->data = array_merge($this->data, $_);

			return $this->data;
		}
                
                $file = DIR_LANG . $this->directory . '/main.php';
                
		if (file_exists($file)) {
			$_ = array();

			require($file);

			$this->data = array_merge($this->data, $_);

			return $this->data;
		}
                
	}
}