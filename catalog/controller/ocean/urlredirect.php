<?php

class ControllerOceanUrlRedirect extends Controller {
   public function index() {
   
        $this->load->model('ocean/urlredirect');
        
        if (!isset($this->request->get['old_url'])) {
            $this->redirect("/"); 
        }
        
        $old_url = $this->request->get['old_url'];        
        $redirect_url = $this->model_ocean_urlredirect->getRedirectUrl($old_url);
        if ($redirect_url){
            $this->redirect($redirect_url['new_url']);
        }
   }
}
