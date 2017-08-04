<!--
Author : Aguzrybudy
Created : Selasa, 19-April-2016
Title : Crud Menggunakan Modal Bootsrap
-->
<div class="modal-dialog">
    <div class="modal-content">
		
    	<div class="modal-header">
            <button type="button" class="close" id="close" name="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel">Lengkapi Data Kategori Produk</h4>
        </div>

        <div class="modal-body">
        		<form name="Frmchar" id="Frmchar" method="post" class="Frmchar" enctype="multipart/form-data">
									
										<div class="form-group">
											<label>Kode Kategori</label>
											<input class="form-control input-sm" name="char_code" id="char_code" placeholder="kode kategori" >
										</div>
										
										<div class="form-group">
											<label>Nama Kategori</label>
											<input class="form-control input-sm" name="char_name" id="char_name" placeholder="nama kategori">
										</div>
																		
										
										<div class="modal-footer">
											<!--
											<button class="btn btn-sm" data-dismiss="modal">
												<i class="ace-icon fa fa-times"></i>Cancel
											</button>
											
											<button type="reset" name="reset" class="btn btn-sm">
												<i class="ace-icon fa fa-check"></i>Reset
											</button>
											-->
											<input class="btn btn-info btn-xs" type="button" id="simpan" name="simpan" value="Simpan"/>
											
										</div>
									</form>
		</div>

           
        </div>
    </div>
<script type="text/javascript">
   $(document).ready(function () {
   $("#close").click(function(e) {
      window.location.href = '';
        });
      });
</script>