<?php
class ModelOceanUrlredirect extends Model {
	
	public function getRedirectUrl($old_url) {
		
        $old_url = strtolower($old_url);
        $sql = "SELECT url_redirect_id, lower(new_url) as new_url From ocean_url_redirects WHERE LOWER(old_url) = '" . $old_url . "'";
		$query = $this->db->query($sql);
		
		if ($query->num_rows) {
			return array(
				'url_redirect_id' => $query->row['url_redirect_id'],
				'new_url'         => $query->row['new_url']
			);
		} else {
			return false;
		}
	}

}
?>