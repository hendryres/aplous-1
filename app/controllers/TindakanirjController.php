<?php

class TindakanirjController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "TINDAKAN IRJ" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }
	
	public function simpantindakanAction()
	{
		$usr = new Irjtindakan();
		$usr->rm = $this->request->getPost("txtrm");
		$usr->tindakan = $this->request->getPost("txttindakan");
		$usr->dokter = $this->request->getPost("txtdokter");
		$usr->tanggal = $this->request->getPost("dtptanggal");
		$usr->harga = $this->request->getPost("txtharga");
		$usr->qty = $this->request->getPost("txtqty");
		$usr->icd9 = $this->request->getPost("txticd9");
		//$success = $usr->save($this->request->getPost(), array('modName', 'link', 'icon', 'urutan'));
		   
		if ( !$usr->save() ) {
			echo 0;
		}
		else
		{
			echo 1;
		}
	}
	
	public function simpandiagnosaAction()
	{
		$usr = new Irjdiagnosa();
		$usr->rm = $this->request->getPost("txtrm");
		$usr->icd10 = $this->request->getPost("txticd10");
		$usr->dokter = $this->request->getPost("txtdokter");
		$usr->jenis = $this->request->getPost("cmbjenis");
		$usr->tanggal = $this->request->getPost("dtptanggal");
		//$success = $usr->save($this->request->getPost(), array('modName', 'link', 'icon', 'urutan'));
		   
		if ( !$usr->save() ) {
			echo 0;
		}
		else
		{
			echo 1;
		}
	}
	
	public function simpanequipmentAction()
	{
		$usr = new Irjequipment();
		$usr->rm = $this->request->getPost("txtrm");
		$usr->equipment = $this->request->getPost("txtequipment");
		$usr->dokter = $this->request->getPost("txtdokter");
		$usr->tanggal = $this->request->getPost("dtptanggal");
		$usr->harga = $this->request->getPost("txtharga");
		$usr->qty = $this->request->getPost("txtqty");
		//$success = $usr->save($this->request->getPost(), array('modName', 'link', 'icon', 'urutan'));
		   
		if ( !$usr->save() ) {
			echo 0;
		}
		else
		{
			echo 1;
		}
	}
	
	public function simpanobatruanganAction()
	{
		$usr = new Irjobatruangan();
		$usr->rm = $this->request->getPost("txtrm");
		$usr->depo = $this->request->getPost("cmbdepo");
		$usr->obat = $this->request->getPost("txtobat");
		$usr->satuan = $this->request->getPost("txtsatuan");
		$usr->tanggal = $this->request->getPost("dtptanggal");
		$usr->dokter = $this->request->getPost("txtdokter");
		$usr->qty = $this->request->getPost("txtqty");
		//$success = $usr->save($this->request->getPost(), array('modName', 'link', 'icon', 'urutan'));
		   
		if ( !$usr->save() ) {
			echo 0;
		}
		else
		{
			echo 1;
		}
	}
	
	public function simpanrujukAction()
	{
		$usr = new Irjrujuk();
		$usr->rm = $this->request->getPost("txtrm");
		$usr->instalasi = $this->request->getPost("cmbinstalasi");
		$usr->poli = $this->request->getPost("cmbpoli");
		$usr->nosep = $this->request->getPost("txtnosep");
		$usr->dokter = $this->request->getPost("txtdokter");
		$usr->tanggalrujuk = $this->request->getPost("dtptanggal");
		//$success = $usr->save($this->request->getPost(), array('modName', 'link', 'icon', 'urutan'));
		   
		if ( !$usr->save() ) {
			echo 0;
		}
		else
		{
			echo 1;
		}
	}
	
	public function simpanstatusAction()
	{
		$usr = new Irjstatus();
		$usr->rm = $this->request->getPost("txtrm");
		$usr->jamkeluar = $this->request->getPost("dtpjamkeluar");
		$usr->status = $this->request->getPost("cmbstatus");
		$usr->alasankeluar = $this->request->getPost("cmbalasankeluar");
		$usr->keadaankeluar = $this->request->getPost("cmbkeadaankeluar");
		//$success = $usr->save($this->request->getPost(), array('modName', 'link', 'icon', 'urutan'));
		   
		if ( !$usr->save() ) {
			echo 0;
		}
		else
		{
			echo 1;
		}
	}
	
	public function lihattindakanAction()
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
	
	public function lihatdiagnosaAction()
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
	
	public function lihatequipmentAction()
    {
		$idrm=$this->request->getPost('idrm');
		//$filter = array('rm' => $id);
		$usr = Irjequipment::find();
		$articles = Irjequipment::find("rm = '$idrm'");
		//$this->view->data=$usr;
		$result = array();
		//$data = [];
		foreach ($articles as $user) {
			
		   $result['emails'][] = array(
				"id" => $user->id,
				"subject" => $user->equipment,
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
		$result['group'] = 'Equipment';
		echo json_encode($result); exit;
    }
	
	public function lihatobatruanganAction()
    {
		$idrm=$this->request->getPost('idrm');
		//$filter = array('rm' => $id);
		$usr = Irjobatruangan::find();
		$articles = Irjobatruangan::find("rm = '$idrm'");
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
	
	public function lihatrujukAction()
    {
		$idrm=$this->request->getPost('idrm');
		//$filter = array('rm' => $id);
		$usr = Irjrujuk::find();
		$articles = Irjrujuk::find("rm = '$idrm'");
		//$this->view->data=$usr;
		$result = array();
		//$data = [];
		foreach ($articles as $user) {
			
		   $result['emails'][] = array(
				"id" => $user->id,
				"subject" => $user->instalasi,
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
		$result['group'] = 'Rujuk';
		echo json_encode($result); exit;
    }
	
	public function lihatstatusAction()
    {
		$idrm=$this->request->getPost('idrm');
		//$filter = array('rm' => $id);
		$usr = Irjstatus::find();
		$articles = Irjstatus::find("rm = '$idrm'");
		//$this->view->data=$usr;
		$result = array();
		//$data = [];
		foreach ($articles as $user) {
			
		   $result['emails'][] = array(
				"id" => $user->id,
				"subject" => $user->status,
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
		$result['group'] = 'Status';
		echo json_encode($result); exit;
    }
}
