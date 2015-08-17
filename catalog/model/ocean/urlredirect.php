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

    public function verifyPostal($postalcode, $city, $region, $country) {
		
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ocean_global_geolocation WHERE postalCode = '" . $postalcode . "' AND city = '" . $city . "' AND region = (SELECT code FROM zone WHERE  zone_id = ". $region ." and country_id = ". $country .") AND country = (SELECT iso_code_2 from country where country_id = ". $country . ")");
		
		return $query->row;
	} 
}
?>