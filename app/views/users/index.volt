{% extends 'template/aplous.volt' %}

{% block content %}
	<div class="top-content">
        <div class="container-fluid container-fixed-lg sm-p-l-20 sm-p-r-20">
            <ul class="breadcrumb">
                <li>
					<p>Pages</p>
                </li>
                <li>
					<a href="#" class="active">Users</a>
                </li>
            </ul>
        </div>
	</div>
    <!-- START JUMBOTRON -->
    <div class="jumbotron" >
        <div class="sm-p-l-20 sm-p-r-20 m-b-50">

        </div>
    </div>
    <!-- END JUMBOTRON -->
	<form name="frmuser" id="frmuser" method="post" class="frmuser" onsubmit="register();return false;" enctype="multipart/form-data">
		<div class="panel panel-transparent"><!-- START PANEL -->
			<div class="panel-heading">
				<div class="panel-title">Data User
				</div>
				<div class="tools">
					<a class="collapse" href="javascript:;"></a>
					<a class="config" data-toggle="modal" href="#grid-config"></a>
					<a class="reload" href="javascript:;"></a>
					<a class="remove" href="javascript:;"></a>
				</div>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group form-group-default">
							<label>Nama Belakang</label>
							<input type="text" name="txtnamabelakang"  class="form-control" required>
						</div>
						<div class="form-group form-group-default">
							<label>Nama Depan</label>
							<input type="text" name="txtnamadepan" class="form-control" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default">
							<label>Username</label>
							<input type="text" name="txtusername" class="form-control" required>
						</div>
						<div class="form-group form-group-default">
							<label>Password</label>
							<input type="password" name="txtpassword" class="form-control" required>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Instalasi</label>
							 <select class="full-width" data-placeholder="Pilih Instalasi" data-init-plugin="select2" name="cmbinstalasi">
								<optgroup label="Alaskan/Hawaiian Time Zone">
									<option value="">-</option>
									<option value="RJ">Rawat Jalan</option>
									<option value="RI">Rawat Inap</option>
									<option value="IGD">IGD</option>
									<option value="MCU">MCU</option>
									<option value="FA">FARMASI</option>
								</optgroup>
							</select>
						</div>
						<div class="form-group form-group-default form-group-default-select2">
							<label class="">Poli</label>
							 <select class="full-width" data-placeholder="Pilih Poli" data-init-plugin="select2" name="cmbpoli">
								<optgroup label="Alaskan/Hawaiian Time Zone">
									<option value="">-</option>
									<option value="BE">Bedah</option>
									<option value="MA">Mata</option>
									<option value="PA">Paru</option>
									<option value="GI">Gizi</option>
								</optgroup>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-heading">
				<div class="panel-title">Hak Akses
				</div>
				<div class="tools">
					<a class="collapse" href="javascript:;"></a>
					<a class="config" data-toggle="modal" href="#grid-config"></a>
					<a class="reload" href="javascript:;"></a>
					<a class="remove" href="javascript:;"></a>
				</div>
			</div>
			<div class="panel-body">
				<div class="col-sm-2">
					<div class="checkbox check-success">
						<input type="checkbox" value="1" id="check1" name="check1">
						<label for="check1">Admin</label>
					</div>
					<div class="checkbox check-success  ">
						<input type="checkbox"  value="1" id="check2" name="check2">
						<label for="check2">Pendafataran Pasien</label>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="checkbox check-success">
						<input type="checkbox" value="1" id="check3" name="check3">
						<label for="check3">Pendaftaran User</label>
					</div>
					<div class="checkbox check-success">
						<input type="checkbox" value="1" id="check4" name="check4">
						<label for="check4">Rawat Jalan</label>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="checkbox check-success">
						<input type="checkbox"  value="1" id="check5" name="check5">
						<label for="check5">Rekam Medis</label>
					</div>
					<div class="checkbox check-success">
						<input type="checkbox"  value="1" id="check6" name="check6">
						<label for="check6">Rawat Inap</label>
					</div>
				</div>
				<div class="col-sm-2">
					<div class="checkbox check-success">
						<input type="checkbox"  value="1" id="check7" name="check7">
						<label for="check7">Dokter</label>
					</div>
				</div>
			</div>
		</div>
			
		<button class="btn-save btn btn-primary btn-lg" type="submit" name="btnregister" id="btnregister"> Tambah</button>
		<button class="btn-rst btn btn-info btn-lg" type="reset" name="reset">Reset</button>
				
	</form>

<script type="text/javascript">
 function register()
 {
			var data = $('#frmuser').serialize();
			$.ajax({
                type:"POST",
                url:"{{ url('User/register') }}",
                data:data,
                success:function(response)
				{
					if( response==1 )
					{
						swal({ 
                            title: "Transaksi Berhasil!", 
                            text: "I will close in 2 seconds.",
                            timer: 2000,
                            type: "success"
									
                        }); 
						window.location.href='http://localhost/aplous/user';
					}
					else
					{
						sweetAlert("Transaksi gagal!", "", "error");
					}
                },
				error:function()
				{
					sweetAlert("Error!", "", "error");
				}
            });
 }
 </script>
{% endblock %}