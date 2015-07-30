<?php
    
    function str_truncate($str, $limit){
        if (strlen($str) > $limit)
        {
          return substr($str, 0, $limit - 3) . '...';
        }
        return $str;
    }

?>