<?php

class PasienController extends ControllerBase
{
	public function initialize() 
	{
		$this->tag->setTitle( "Pasien Baru" );
		parent::initialize();
	}
	
    public function indexAction()
    {
		/* menu poli */
		$poli = Masterpoli::find();
		$this->view->data=$poli;
    }
	
	public function simpanAction()
	{
		$data = new pasienbaru();
		$data->fldrm = $this->request->getPost("txtrm");
		$data->fldnamalengkap = $this->request->getPost("txtnamalengkap");
		$data->fldpendidikan = $this->request->getPost("cmbpendidikan");
		$data->fldgelar = $this->request->getPost("txtgelar");
		$data->fldnamakeluarga = $this->request->getPost("txtnamakeluarga");
		$data->fldnamaayah = $this->request->getPost("txtnamaayah");
		$data->fldnamaibu = $this->request->getPost("txtnamaibu");
		$data->fldstatuskawin = $this->request->getPost("cmbstatuskawin");
		$data->fldnamapasangan = $this->request->getPost("txtnamapasangan");
		$data->fldjeniskelamin = $this->request->getPost("rdijeniskelamin");
		$data->fldusia = $this->request->getPost("txtusia");
		$data->fldtempatlahir = $this->request->getPost("txttempatlahir");
		$data->fldalamat = $this->request->getPost("txtalamat");
		$data->fldwilayah = $this->request->getPost("cmbwilayah");
		$data->fldkabupaten = $this->request->getPost("cmbkabupaten");
		$data->fldkecamatan = $this->request->getPost("cmbkecamatan");
		$data->fldkodepos = $this->request->getPost("txtkodepos");
		$data->fldsuku = $this->request->getPost("txtsuku");
		$data->fldkebangsaan = $this->request->getPost("txtkebangsaan");
		$data->fldhandphone = $this->request->getPost("txthandphone");
		$data->fldphone = $this->request->getPost("txtphone");
		$data->fldfax = $this->request->getPost("txtfax");
		$data->fldemail = $this->request->getPost("txtemail");
		$data->fldagama = $this->request->getPost("cmbagama");
		$data->fldpekerjaan = $this->request->getPost("txtpekerjaan");
		$data->fldalamatbekerja = $this->request->getPost("txtalamatbekerja");
		$data->fldphonekantor = $this->request->getPost("txtphonekantor");
		$data->fldidentitas = $this->request->getPost("txtidentitas");
		$data->fldpassport = $this->request->getPost("txtpassport");
		$data->fldgoldarah = $this->request->getPost("rdigoldarah");
		$data->fldrefferensi = $this->request->getPost("txtrefferensi");
		$data->add_date = new Phalcon\Db\RawValue("now()");
		
		if ( !$data->save() ) 
		{
			echo 0;
		}
		else
		{
			echo 1;
		}
	}

}

