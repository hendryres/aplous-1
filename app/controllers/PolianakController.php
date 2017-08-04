<?php

class PolianakController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "POLI ANAK" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
		
		/* menu tindakan */
		$tindakan = Mastertindakan::find();
		$this->view->datatindakan=$tindakan;
    }
	
	public function simpandiagnosaAction()
	{
		//$poli = "polianak";
		$usr = new Irjdiagnosa();
		$usr->rm = $this->request->getPost("txtrm");
		$usr->icd10 = $this->request->getPost("txticd10");
		$usr->dokter = $this->request->getPost("txtdokter");
		$usr->jenis = $this->request->getPost("cmbjenis");
		$usr->tanggal = $this->request->getPost("dtptanggal");
		$usr->poli = "polianak";
		//$success = $usr->save($this->request->getPost(), array('modName', 'link', 'icon', 'urutan'));
		   
		if ( !$usr->save() ) {
			echo 0;
		}
		else
		{
			echo 1;
		}
	}
	
	public function simpanobatAction()
	{
		$usr = new Irjobat();
		$usr->rm = $this->request->getPost("txtrm");
		$usr->depo = $this->request->getPost("cmbdepo");
		$usr->obat = $this->request->getPost("txtobat");
		$usr->satuan = $this->request->getPost("txtsatuan");
		$usr->tanggal = $this->request->getPost("dtptanggal");
		$usr->dokter = $this->request->getPost("txtdokter");
		$usr->qty = $this->request->getPost("txtqty");
		$usr->poli = "polianak";
		//$success = $usr->save($this->request->getPost(), array('modName', 'link', 'icon', 'urutan'));
		   
		if ( !$usr->save() ) {
			echo 0;
		}
		else
		{
			echo 1;
		}
	}
	
	public function linkdiagnosaAction()
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
	
	public function linkobatAction()
    {
		$idrm=$this->request->getPost('idrm');
		//$filter = array('rm' => $id);
		$usr = Irjobat::find();
		$articles = Irjobat::find("rm = '$idrm'");
		//$this->view->data=$usr;
		$result = array();
		//$data = [];
		foreach ($articles as $user) {
			
		   $result['emails'][] = array(
				"id" => $user->id,
				"subject" => $user->obat,
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
		$result['group'] = 'Obat Ruangan';
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

	public function autocompleteicd10Action()
	{
		$namaicd10=strtolower($this->request->getPost('namaicd10'));
		$rows = Mastericd10::find("LOWER(namaicd10) like '%$namaicd10%'");
		//$rows = Mastericd10::find();
		foreach($rows as $row)
		{
			 $result[] = $row;
		}
		echo json_encode($result);
	}
	
	public function autoAction()
	{
		$namaicd10=strtolower($this->request->get('namaicd10'));
		$query = "select kodeicd10,namaicd10 from mastericd10 where namaicd10 like '%$namaicd10%' or kodeicd10 like '%$namaicd10%'"; 
		$result=array(); 
		$sql=$this->db->query($query);         
		while($row=$sql->fetchArray())
		{
			$result[] = $row['kodeicd10'].'-'.$row['namaicd10'];
		}
		echo json_encode($result);
	}
}

