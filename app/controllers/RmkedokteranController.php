<?php

class RmkedokteranController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "RM KEDOKTERAN" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }
	
	public function linkanakAction()
    {
		$idrm=$this->request->getPost('idrm');
		//$filter = array('rm' => $id);
		$usr = Irjdiagnosa::find();
		$articles = Irjdiagnosa::find("rm = '$idrm'");
		//$this->view->data=$usr;
		$result = array();
		//$data = [];
		foreach ($articles as $user) {
			
		   $result['emails'][] = array(
				"id" => $user->id,
				"subject" => $user->icd10,
				"to"=> ["David Nester"],
				"body"=> "Data details ",
				"time"=> "5 Mins ago",
				"datetime" => "Today at 1:33pm",
				"from"=> "David Nester",
				"dp"=> "assets/img/profiles/avatar.jpg",
				"dpRetina"=> "assets/img/profiles/avatar2x.jpg"
				);
				
		}
		$result['list'] = $result['emails'];
		$result['group'] = 'Diagnosa';
		echo json_encode($result); exit;
    }
	
	public function linkanastesiAction()
    {
		$idrm=$this->request->getPost('idrm');
		//$filter = array('rm' => $id);
		$usr = Irjtindakan::find();
		$articles = Irjtindakan::find("rm = '$idrm'");
		//$this->view->data=$usr;
		$result = array();
		//$data = [];
		foreach ($articles as $user) {
			
		   $result['emails'][] = array(
				"id" => $user->id,
				"subject" => $user->tindakan,
				"to"=> ["David Nester"],
				"body"=> "Data details ",
				"time"=> "5 Mins ago",
				"datetime" => "Today at 1:33pm",
				"from"=> "David Nester",
				"dp"=> "assets/img/profiles/avatar.jpg",
				"dpRetina"=> "assets/img/profiles/avatar2x.jpg"
				);
				
		}
		$result['list'] = $result['emails'];
		$result['group'] = 'Tindakan';
		echo json_encode($result); exit;
    }
}

