
{% extends 'template/aplous.volt' %}

{% block content %}
          <!-- START APP -->
          <!-- START SECONDARY SIDEBAR MENU-->
          <nav class="secondary-sidebar padding-30" style="height:100%" id="nav">
			<div style="color: #EFF4F9;" class="form-group">
			<label>RM</label>
			<input name="rmid" style="color: #43484E;" type="text" value="1">
			</div>
			<div id="div_input" style="display:none">
            <button id="btninput" value="" class="btn btn-complete btn-block m-b-30">input baru</button>
			</div>
            <ul class="main-menu">
				{% for tindakan in datatindakan %}
				<li id="{{ tindakan.liid }}" class="">
					<a id="{{ tindakan.linkid }}" class="link" href="#">
						<span class="title"><i class="pg-folder"></i> {{ tindakan.namatindakan }}</span>
					</a>
				</li>
				{% endfor %}  
            </ul>
          </nav>
          <!-- END SECONDARY SIDEBAR MENU -->
          <div class="inner-content full-height" id="subpage">
            <div class="split-view" id="view">
              <!-- START SPLIT LIST VIEW -->
              <div class="split-list">
                <!--<a class="list-refresh" href="#"><i class="fa fa-refresh"></i></a>-->
                <div id="list_patient">
                  <!-- START EMAIL LIST SORTED BY DATE -->
                  <!-- END EMAIL LIST SORTED BY DATE -->
                </div>
              </div>
              <!-- END SPLIT LIST VIEW -->
              <!-- START SPLIT DETAILS -->
              <div data-email="opened" class="split-details" id="details">
                <div class="no-result">
                  <h1>No record has been selected</h1>
                </div>
                <div class="email-content-wrapper" style="display:none">
                  <div class="email-content" style="width:100%">
                    <div class="email-content-header">
                      <div class="thumbnail-wrapper d48 circular bordered">
                        <img width="40" height="40" alt="" data-src-retina="assets/img/profiles/avatar2x.jpg" data-src="assets/img/profiles/avatar.jpg" src="assets/img/profiles/avatar2x.jpg">
                      </div>
                      <div class="sender inline m-l-10">
                        <p class="name no-margin bold">
                        </p>
                        <p class="datetime no-margin"></p>
                      </div>
                      <div class="clearfix"></div>
                      <div class="subject m-t-20 m-b-20 semi-bold">
                      </div>
                      <div class="fromto">
                        <div class="pull-left">
                          <div class="btn-group dropdown-default">
                            <a class="btn dropdown-toggle btn-small btn-rounded" data-toggle="dropdown" href="#">
                                            David Nester
                                            <span class="caret"></span>
                                            </a>
                            <ul class="dropdown-menu">
                              <li><a href="#">Action</a>
                              </li>
                              <li><a href="#">Friend</a>
                              </li>
                              <li><a href="#">Report</a>
                              </li>
                            </ul>
                          </div>
                          <label class="inline">
                            <span class="muted">&nbsp;&nbsp;to</span>
                            <span class=" small-text">johnsmith@skyace.com</span>
                          </label>
                        </div>
                      </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="email-content-body m-t-20">
                    </div>
                    <div class="wysiwyg5-wrapper b-a b-grey m-t-30">
                      
                    </div>
			
                  </div>
                </div>
              </div>
              <!-- END SPLIT DETAILS -->
            </div>
          </div>
		  <!-- START COMPOSE BUTTON FOR TABS -->
              <div class="compose-wrapper visible-xs">
                <a class="toggle-secondary-sidebar compose-email text-info pull-right m-r-10 m-t-10" href="#"><i class="fa fa-navicon"></i></a>
              </div>
              <!-- END COMPOSE BUTTON -->
          <!-- END APP -->
		 
		
<script>
(function($){
	'use strict';
	$(document).ready(function(){
		$('li').on('click', '.link', function(e) {
        //e.stopPropagation();
		e.preventDefault();
			var link =$(this).attr("id");
			document.getElementById('div_input').style.display = 'block';
			document.getElementById("list_patient").innerHTML="";
			$("#btninput").val(link);
			var emailList = $('#list_patient');
			var idrm = $("input[name='rmid']").val();
			var dataForm = {idrm:idrm};
			$.postJSON("Polianak/"+ link, dataForm, 
			function(data) {
					$('.email-content-wrapper').hide();
					$('.no-result').show();
					var obj = data.emails;
					var group = data.group;
					var list = data.list;

					var listViewGroupCont = $('<div/>', {
						"class": "list-view-group-container"
					});
					listViewGroupCont.append('<div class="list-view-group-header"><span>' + group + '</span></div>');
					var ul = $('<ul/>', {
						"class": "no-padding"
					});

					$.each(list, function(j) {
						
						var $this = list[j];
						var id = $this.id;
						var dp = $this.dp;
						var dpRetina = $this.dpRetina;
						var to = $this.to.join();
						var subject = $this.subject;
						var body = $this.body.replace(/<(?:.|\n)*?>/gm, '');
						var time = $this.time;
						var colors = ['b-success', 'b-primary', 'b-warning', 'b-info', 'b-complete', 'b-danger'];
						var color = colors[Math.floor(Math.random() * (6))];
						var li = '<li class="item padding-15" data-email-id="' + id + '"> \
									<div class="thumbnail-wrapper d32 circular bordered ' + color + '"> \
										<img width="40" height="40" alt="" data-src-retina="' + dpRetina + '" data-src="' + dp + '" src="' + dpRetina + '"> \
									</div> \
									<div class="checkbox  no-margin p-l-10"> \
										<input type="checkbox" value="1" id="emailcheckbox-' + dataForm + "-" + j + '"> \
										<label for="emailcheckbox-' + dataForm.id + "-" + j + '"></label> \
									</div> \
									<div class="inline m-l-15"> \
										<p class="recipients no-margin hint-text small">' + to + '</p> \
										<p class="subject no-margin">' + subject + '</p> \
										<p class="body no-margin"> \
										 ' + body + ' \
										</p> \
									</div> \
									<div class="datetime">' + time + '</div> \
									<div class="clearfix"></div> \
								</li>';
						ul.append(li);
						
					});

					listViewGroupCont.append(ul);
					emailList.append(listViewGroupCont);
				emailList.ioslist();
			},
			function(jqXHR, textStatus, errorThrown){
				console.log(errorThrown);
			});
		});
	
	$('body').on('click', '.item', function(e) {
        e.stopPropagation();
		var btnid = $("#btninput").val();
		if (document.getElementById("btninput").value == btnid)
			{
				var emailOpened = $('[data-email="opened"]');
				var editorTemplate = {
					"font-styles": function(locale) {
						return '<li class="dropdown dropup">' + '<a data-toggle="dropdown" class="btn btn-default dropdown-toggle ">    <span class="glyphicon glyphicon-font"></span>    <span class="current-font">Normal text</span>    <b class="caret"></b>  </a>' + '<ul class="dropdown-menu">    <li><a tabindex="-1" data-wysihtml5-command-value="p" data-wysihtml5-command="formatBlock" href="javascript:;" unselectable="on">Normal text</a></li>     <li><a tabindex="-1" data-wysihtml5-command-value="h1" data-wysihtml5-command="formatBlock" href="javascript:;" unselectable="on">Heading 1</a></li>    <li><a tabindex="-1" data-wysihtml5-command-value="h2" data-wysihtml5-command="formatBlock" href="javascript:;" unselectable="on">Heading 2</a></li>    <li><a tabindex="-1" data-wysihtml5-command-value="h3" data-wysihtml5-command="formatBlock" href="javascript:;" unselectable="on">Heading 3</a></li>    <li><a tabindex="-1" data-wysihtml5-command-value="h4" data-wysihtml5-command="formatBlock" href="javascript:;" unselectable="on">Heading 4</a></li>    <li><a tabindex="-1" data-wysihtml5-command-value="h5" data-wysihtml5-command="formatBlock" href="javascript:;" unselectable="on">Heading 5</a></li>    <li><a tabindex="-1" data-wysihtml5-command-value="h6" data-wysihtml5-command="formatBlock" href="javascript:;" unselectable="on">Heading 6</a></li>  </ul>' + '</li>';
					},
					emphasis: function(locale) {
						return '<li>' + '<div class="btn-group">' + '<a tabindex="-1" title="CTRL+B" data-wysihtml5-command="bold" class="btn  btn-default" href="javascript:;" unselectable="on"><i class="editor-icon editor-icon-bold"></i></a>' + '<a tabindex="-1" title="CTRL+I" data-wysihtml5-command="italic" class="btn  btn-default" href="javascript:;" unselectable="on"><i class="editor-icon editor-icon-italic"></i></a>' + '<a tabindex="-1" title="CTRL+U" data-wysihtml5-command="underline" class="btn  btn-default" href="javascript:;" unselectable="on"><i class="editor-icon editor-icon-underline"></i></a>' + '</div>' + '</li>';
					},
					blockquote: function(locale) {
						return '<li>' + '<a tabindex="-1" data-wysihtml5-display-format-name="false" data-wysihtml5-command-value="blockquote" data-wysihtml5-command="formatBlock" class="btn  btn-default" href="javascript:;" unselectable="on">' + '<i class="editor-icon editor-icon-quote"></i>' + '</a>' + '</li>'
					},
					lists: function(locale) {
						return '<li>' + '<div class="btn-group">' + '<a tabindex="-1" title="Unordered list" data-wysihtml5-command="insertUnorderedList" class="btn  btn-default" href="javascript:;" unselectable="on"><i class="editor-icon editor-icon-ul"></i></a>' + '<a tabindex="-1" title="Ordered list" data-wysihtml5-command="insertOrderedList" class="btn  btn-default" href="javascript:;" unselectable="on"><i class="editor-icon editor-icon-ol"></i></a>' + '<a tabindex="-1" title="Outdent" data-wysihtml5-command="Outdent" class="btn  btn-default" href="javascript:;" unselectable="on"><i class="editor-icon editor-icon-outdent"></i></a>' + '<a tabindex="-1" title="Indent" data-wysihtml5-command="Indent" class="btn  btn-default" href="javascript:;" unselectable="on"><i class="editor-icon editor-icon-indent"></i></a>' + '</div>' + '</li>'
					},
					image: function(locale) {
						return '<li>' + '<div class="bootstrap-wysihtml5-insert-image-modal modal fade">' + '<div class="modal-dialog ">' + '<div class="modal-content">' + '<div class="modal-header">' + '<a data-dismiss="modal" class="close">×</a>' + '<h3>Insert image</h3>' + '</div>' + '<div class="modal-body">' + '<input class="bootstrap-wysihtml5-insert-image-url form-control" value="http://">' + '</div>' + '<div class="modal-footer">' + '<a data-dismiss="modal" class="btn btn-default">Cancel</a>' + '<a data-dismiss="modal" class="btn btn-primary">Insert image</a>' + '</div>' + '</div>' + '</div>' + '</div>' + '<a tabindex="-1" title="Insert image" data-wysihtml5-command="insertImage" class="btn  btn-default" href="javascript:;" unselectable="on">' + '<i class="editor-icon editor-icon-image"></i>' + '</a>' + '</li>'
					},
					link: function(locale) {
						return '<li>' + '<div class="bootstrap-wysihtml5-insert-link-modal modal fade">' + '<div class="modal-dialog ">' + '<div class="modal-content">' + '<div class="modal-header">' + '<a data-dismiss="modal" class="close">×</a>' + '<h3>Insert link</h3>' + '</div>' + '<div class="modal-body">' + '<input class="bootstrap-wysihtml5-insert-link-url form-control" value="http://">' + '<div class="checkbox check-success"> <input type="checkbox" class="bootstrap-wysihtml5-insert-link-target" checked="checked" value="1" id="link-checkbox"> <label for="link-checkbox">Open link in new window</label></div>' + '</div>' + '<div class="modal-footer">' + '<a data-dismiss="modal" class="btn btn-default">Cancel</a>' + '<a data-dismiss="modal" class="btn btn-primary" href="#">Insert link</a>' + '</div>' + '</div>' + '</div>' + '</div>' + '<a tabindex="-1" title="Insert link" data-wysihtml5-command="createLink" class="btn  btn-default" href="javascript:;" unselectable="on">' + '<i class="editor-icon editor-icon-link"></i>' + '</a>' + '</li>'
					}
				}

				var editorOptions = {
					"font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
					"emphasis": true, //Italics, bold, etc. Default true
					"lists": false, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
					"html": false, //Button which allows you to edit the generated HTML. Default false
					"link": true, //Button to insert a link. Default true
					"image": true, //Button to insert an image. Default true,
					"color": false, //Button to change color of font  
					"blockquote": true, //Blockquote  
					stylesheets: ["pages/css/editor.css"],
					customTemplates: editorTemplate
				};
				var idrm = $("input[name='rmid']").val();
				var id = $(this).attr('data-email-id');
				var email = null;
				var thumbnailWrapper = $(this).find('.thumbnail-wrapper');
				var dataForm = {idrm:idrm,id:id};
				$.postJSON("Polianak/"+ btnid, dataForm, function(data) {
						var obj = data.emails;
						var group = data.group;
						var list = data.list;
						$.each(list, function(i) {
							if (list[i].id == id) {
								email = list[i];
								return;
							}
							if (email != null) return;
						});

						emailOpened.find('.sender .name').text(email.from);
						emailOpened.find('.sender .datetime').text(email.datetime);
						emailOpened.find('.subject').text(email.subject);
						emailOpened.find('.email-content-body').html(email.body);

						var thumbnailClasses = thumbnailWrapper.attr('class').replace('d32', 'd48');
						emailOpened.find('.thumbnail-wrapper').html(thumbnailWrapper.html()).attr('class', thumbnailClasses);

						$('.no-result').hide();
						$('.actions-dropdown').toggle();
						$('.actions, .email-content-wrapper').show();
						if ($.Pages.isVisibleSm() || $.Pages.isVisibleXs()) {
							$('.split-list').toggleClass('slideLeft');
						}

						!$('.email-reply').data('wysihtml5') && $('.email-reply').wysihtml5(editorOptions);

						$(".email-content-wrapper").scrollTop(0);

						// Initialize email action menu 
						/*$('.menuclipper').menuclipper({
							bufferWidth: 20
						});*/
					}, function(jqXHR, textStatus, errorThrown){
						console.log(errorThrown);
					});

				$('.item').removeClass('active');
				$(this).addClass('active');
			}
		

    });

	});
	
	// Toggle email sidebar on mobile view
    $('.toggle-secondary-sidebar').click(function(e) {
        e.stopPropagation();
        $('.secondary-sidebar').toggle();
    });

    $('.split-list-toggle').click(function() {
        $('.split-list').toggleClass('slideLeft');
    });

    $('.secondary-sidebar').click(function(e) {
        e.stopPropagation();
    })

    $(window).resize(function() {

        if ($(window).width() <= 1024) {
            $('.secondary-sidebar').hide();

        } else {
            $('.split-list').length && $('.split-list').removeClass('slideLeft');
            $('.secondary-sidebar').show();
        }
    });
})(window.jQuery);
</script>

<script>
(function($){
	$(document).ready(function(){
		$("#btninput").off("click").on("click", function(e){
			if (document.getElementById("btninput").value == "linkdiagnosa")
			{
				document.getElementById("subpage").innerHTML="";
				var tes = '<div class="panel panel-transparent">\
					<div class="panel-heading">\
						<div class="panel-title">Input data diagnosa IRJ\
						</div>\
					</div>\
					<div class="panel-body">\
						<div id="kotak">\
							<form name="frmirjdiagnosa" id="frmirjdiagnosa" method="post" class="frmirjdiagnosa" onsubmit="simpandiagnosa();return false;" enctype="multipart/form-data">\
							<input class="hidden" type="text" name="txtrm" value="1" readonly="">\
							<div class="row">\
								<div class="col-sm-6">\
									<div class="form-group form-group-default required ">\
										<label>ICD 10</label>\
										<input type="text" class="form-control" name="txticd10" id="txticd10" required>\
									</div>\
									<div class="form-group form-group-default required ">\
										<label>Dokter</label>\
										<input type="text" class="form-control" name="txtdokter" id="txtdokter" required>\
									</div>\
								</div>\
								<div class="col-sm-6">\
									<div class="form-group form-group-default form-group-default-select2">\
										<label class="">Jenis</label>\
										<select class="cmb full-width" data-placeholder="Pilih Jenis" data-init-plugin="select2" name="cmbjenis">\
											<optgroup>\
												<option value=""></option>\
												<option value="UTAMA">UTAMA</option>\
												<option value="SEKUNDER">SEKUNDER</option>\
											</optgroup>\
										</select>\
									</div>\
									<div class="form-group form-group-default input-group">\
										<label>Tanggal</label>\
										<input type="text" class="form-control" data-date-format="yyyy-mm-dd" placeholder="Pilih Tanggal" name="dtptanggal" id="dtptangga">\
										<span class="input-group-addon">\
											<i class="fa fa-calendar"></i>\
										</span>\
									</div>\
								</div>\
							</div>\
							<div  class="row">\
								<div class="pull-right">\
									<div class="col-xs-12">\
										<button class="btn btn-primary btn-lg"  type="submit" id="btnsimpan" name="btnsimpan" > Simpan</button>\
										<button class="btn btn-info btn-lg"  type="button" id="batal" >Batal</button>\
										</button>\
									</div>\
								</div>\
							</div>\
							</form>\
						</div>\
					</div>\
				</div>';
				
				$("#subpage").append(tes);
				
				//reload datepicker
				$('#dtptangga').datepicker();
					$(".cmb").select2();
				
				//tombol batal untuk reload div view
				$("#batal").off("click").on("click", function(e){
					document.getElementById("subpage").innerHTML="";
					$("#subpage").load('tindakanirj #view');
					//location.reload(); 
				});
			}else if (document.getElementById("btninput").value == "linkcatatan")
			{
				document.getElementById("subpage").innerHTML="";
				var tes = '<?php $timestamp = time(); ?>\
					<div class="panel panel-transparent">\
						<div class="panel-heading">\
							<div class="panel-title">ODONTOGRAM\
							</div>\
						</div>\
						<div class="panel-body">\
							<div class="panel panel-default">\
								<div id="odontogram_<?php echo $timestamp; ?>" class="odontogram-input"></div>\
							</div>\
							<div class="panel panel-default">\
								<div class="row">\
									<div class="col-sm-6">\
										<div class="form-group">\
											<label class="col-xs-4 control-label">18</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t18"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">17</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t17"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">16</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t16"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">15 (55)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t15,t55"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">14 (54)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t14,t54"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">13 (53)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t13,t53"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">12 (52)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t12,t52"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">11 (51)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t11,t51"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">41 (81)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t41,t81"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">42 (82)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t42,t82"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">43 (83)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t43,t83"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">44 (84)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t44,t84"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">45 (85)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t45,t85"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">46</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t46"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">47</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t47"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">48</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t48"></p></div>\
										</div>\
									</div>\
									<div class="col-sm-6">\
										<div class="form-group">\
											<label class="col-xs-4 control-label">28</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t28"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">27</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t27"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">26</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t26"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">25 (65)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" timestamp="<?php echo $timestamp; ?>" tooth-id="t25,t65"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">24 (64)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t24,t64"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">23 (63)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t23,t63"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">22 (62)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t22,t62"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">21 (61)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t21,t61"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">31 (71)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t31,t71"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">32 (72)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t32,t72"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">33 (73)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t33,t73"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">34 (74)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t34,t74"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">35 (75)</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t35,t75"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">36</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t36"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">37</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t37"></p></div>\
										</div>\
										<div class="form-group">\
											<label class="col-xs-4 control-label">38</label>\
											<div class="col-xs-8"><p class="form-control-static kajian-gilut" timestamp="<?php echo $timestamp; ?>" tooth-id="t38"></p></div>\
										</div>\
									</div>\
								</div>\
							</div>\
						</div>\
					</div>\
					<div class="panel panel-transparent">\
						<div class="panel-heading">\
							<div class="panel-title">PENGKAJIAN AWAL DOKTER GIGI & MULUT\
							</div>\
						</div>\
						<div class="panel-body">\
							<div id="kotak">\
								<form name="frmirjtindakan" id="frmirjtindakan" method="post" class="frmirjtindakan" onsubmit="simpantindakan();return false;" enctype="multipart/form-data">\
								<input class="hidden" type="text" name="txtrm" value="1" readonly="">\
								<div class="row">\
									<div class="panel-heading">\
										<div class="panel-title">Keadaan Umum\
										</div>\
									</div>\
									<div class="col-sm-6">\
										<div class="form-group form-group-default required">\
											<label>Keluhan Utama (S)</label>\
											<textarea class="form-control" style="height:100px" name="txtalamat" required></textarea>\
										</div>\
										<div class="form-group form-group-default required">\
											<label>Riwayat Penyakit Sekarang</label>\
											<textarea class="form-control" style="height:100px" name="txtalamat" required></textarea>\
										</div>\
										<div class="form-group form-group-default required">\
											<label>Riwayat Penyakit Dahulu</label>\
											<textarea class="form-control" style="height:100px" name="txtalamat" required></textarea>\
										</div>\
									</div>\
									<div class="col-sm-6">\
										<div class="form-group form-group-default required">\
											<label>Riwayat Alergi</label>\
											<textarea class="form-control" style="height:100px" name="txtalamat" required></textarea>\
										</div>\
										<div class="form-group form-group-default required">\
											<label>Riwayat Obat</label>\
											<textarea class="form-control" style="height:100px" name="txtalamat" required></textarea>\
										</div>\
										<div class="form-group form-group-default required">\
											<label>Pemeriksaan Fisik (O)</label>\
											<textarea class="form-control" style="height:100px" name="txtalamat" required></textarea>\
										</div>\
									</div>\
								</div>\
								<div class="row">\
									<div class="panel-heading">\
										<div class="panel-title">Keadaan Khusus\
										</div>\
									</div>\
									<div class="col-sm-6">\
										<div class="form-group form-group-default form-group-default-select2">\
											<label class="label-lg">Occulasi</label>\
											<select class="cmb full-width" data-placeholder="Pilih Occulasi" data-init-plugin="select2" name="cmbocculasi">\
												<optgroup>\
													<option value=""></option>\
													<option value="NORMAL_BITE">NORMAL BITE</option>\
													<option value="CROSS_BITE">CROSS BITE</option>\
													<option value="STEEP_BITE">STEEP BITE</option>\
												</optgroup>\
											</select>\
										</div>\
										<div class="form-group form-group-default form-group-default-select2">\
											<label class="label-lg">Tonus Palatinus</label>\
											<select class="cmb full-width" data-placeholder="Pilih Tonus Palatinus" data-init-plugin="select2" name="cmbtonuspalatinus">\
												<optgroup>\
													<option value=""></option>\
													<option value="TIDAK_ADA">TIDAK ADA</option>\
													<option value="KECIL">KECIL</option>\
													<option value="SEDANG">SEDANG</option>\
													<option value="BESAR">BESAR</option>\
													<option value="MULTIPLE">MULTIPLE</option>\
												</optgroup>\
											</select>\
										</div>\
										<div class="form-group form-group-default form-group-default-select2">\
											<label class="label-lg">Tonus Mandibularis</label>\
											<select class="cmb full-width" data-placeholder="Pilih Tonus Mandibularis" data-init-plugin="select2" name="cmbtonusmandibularis">\
												<optgroup>\
													<option value=""></option>\
													<option value="TIDAK_ADA">TIDAK ADA</option>\
													<option value="SISI_KIRI">SISI KIRI</option>\
													<option value="SISI_KANAN">SISI KANAN</option>\
													<option value="KEDUA_SISI">KEDUA SISI</option>\
												</optgroup>\
											</select>\
										</div>\
										<div class="form-group form-group-default form-group-default-select2">\
											<label class="label-lg">Palatum</label>\
											<select class="cmb full-width" data-placeholder="Pilih Palatum" data-init-plugin="select2" name="cmbpalatum">\
												<optgroup>\
													<option value=""></option>\
													<option value="DALAM">DALAM</option>\
													<option value="SEDANG">SEDANG</option>\
													<option value="RENDAH">RENDAH</option>\
												</optgroup>\
											</select>\
										</div>\
									</div>\
									<div class="col-sm-6">\
										<div class="form-group form-group-default form-group-default-select2">\
											<label class="label-lg">Supernumerary Teeth</label>\
											<select onchange="supernumeraryteethFunction(this);" class="cmb full-width" data-placeholder="Pilih Supernumerary Teeth" data-init-plugin="select2" id="txtsupernumeraryteeth" name="cmbsupernumeraryteeth">\
												<optgroup>\
													<option value=""></option>\
													<option value="TIDAK_ADA">TIDAK ADA</option>\
													<option value="ADA">ADA</option>\
												</optgroup>\
											</select>\
										</div>\
										<div class="form-group form-group-default" id="divsupernumeraryteeth" style="display:none">\
											<label>Input Supernumerary Teeth</label>\
											<input type="text" class="form-control" name="txtsupernumeraryteeth" id="txtsupernumeraryteeth">\
										</div>\
										<div class="form-group form-group-default form-group-default-select2">\
											<label class="label-lg">Diasterna</label>\
											<select onchange="diasternaFunction(this);" class="cmb full-width" data-placeholder="Pilih Diasterna" data-init-plugin="select2" name="cmbdiasterna">\
												<optgroup>\
													<option value=""></option>\
													<option value="TIDAK_ADA">TIDAK ADA</option>\
													<option value="ADA">ADA</option>\
												</optgroup>\
											</select>\
										</div>\
										<div class="form-group form-group-default" id="divdiasterna" style="display:none">\
											<label>Input Diasterna</label>\
											<input type="text" class="form-control" name="txtdiasterna" id="txtdiasterna">\
										</div>\
										<div class="form-group form-group-default form-group-default-select2">\
											<label class="label-lg">Gigi Anomali</label>\
											<select onchange="gigianomaliFunction(this);" class="cmb full-width" data-placeholder="Pilih Gigi Anomali" data-init-plugin="select2" name="cmbgigianomali">\
												<optgroup>\
													<option value=""></option>\
													<option value="TIDAK_ADA">TIDAK ADA</option>\
													<option value="ADA">ADA</option>\
												</optgroup>\
											</select>\
										</div>\
										<div class="form-group form-group-default" id="divgigianomali" style="display:none">\
											<label>Input Gigi Anomali</label>\
											<input type="text" class="form-control" name="txtgigianomali" id="txtgigianomali">\
										</div>\
										<div class="form-group form-group-default">\
											<label>Lain-lain</label>\
											<input type="text" class="form-control" name="txtlain" id="txtlain">\
										</div>\
									</div>\
								</div>\
								<div class="row">\
									<div class="modal" id="odontogram-modal-<?php echo $timestamp; ?>" tooth-id="">\
										<div class="modal-dialog">\
											<div class="modal-content">\
												<div class="modal-header">\
													<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>\
													<h4 class="modal-title">Gigi</h4>\
												</div>\
												<div class="modal-body">\
													<div class="row">\
														<div class="col-sm-6">\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="karies_oklusal" odontogram id="check1"><label for="check1">Karies Oklusal</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="karies_distal" odontogram id="check2"><label for="check2">Karies Distal</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="karies_mesial" odontogram id="check3"><label for="check3">Karies Mesial</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="karies_bukal" odontogram id="check4"><label for="check4">Karies Bukal</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="karies_palatal" odontogram id="check5"><label for="check5">Karies Palatal</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="karies_lingual" odontogram id="check6"><label for="check6">Karies Lingual</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="karies_servikal" odontogram id="check7"><label for="check7">Karies Servikal</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="karies_sekunder" odontogram id="check8"><label for="check8">Karies Sekunder</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="migrasi_bukal" odontogram id="check9"><label for="check9">Migrasi Bukal</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="migrasi_palatal" odontogram id="check10"><label for="check10">Migrasi Palatal</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="migrasi_mesial" odontogram id="check11"><label for="check11">Migrasi Mesial</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="migrasi_distal" odontogram id="check12"><label for="check12">Migrasi Distal</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="gigi_goyang_1" odontogram id="check13"><label for="check13">Gigi Goyang / Mobilitas gigi 1&deg;</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="gigi_goyang_2" odontogram id="check14"><label for="check14">Gigi Goyang / Mobilitas gigi 2&deg;</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="gigi_goyang_3" odontogram id="check15"><label for="check15">Gigi Goyang / Mobilitas gigi 3&deg;</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="gigi_goyang_4" odontogram id="check16"><label for="check16">Gigi Goyang / Mobilitas gigi 4&deg;</label></div>\
														</div>\
														<div class="col-sm-6">\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="rot_cw" odontogram id="check17"><label for="check17">Rotasi (kanan)</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="rot_ccw" odontogram id="check18"><label for="check18">Rotasi (kiri)</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="sisa_akar" odontogram id="check19"><label for="check19">Sisa Akar</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="impaksi" odontogram id="check20"><label for="check20">Impaksi</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="edentulous_ridge" odontogram id="check21"><label for="check21">Edentulous Ridge</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="gigi_tiruan_sebagian" odontogram id="check22"><label for="check22">Gigi Tiruan Sebagian</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="gigi_tiruan_cekat" odontogram id="check23"><label for="check23">Gigi Tiruan Cekat</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="crowded" odontogram id="check24"><label for="check24">Crowded</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="diasterna" odontogram id="check25"><label for="check25">Diasterna</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="gangren_pulpa" odontogram id="check26"><label for="check26">Gangren Pulpa</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="tumpatan" odontogram id="check27"><label for="check27">Tumpatan / Crown / Inlay / Onlay</label></div>\
															<div class="checkbox check-success checkbox-circle odontogram-checkbox"><input type="checkbox" value="persistensi" odontogram id="check28"><label for="check28">Persistensi</label></div>\
														</div>\
													</div>\
												</div>\
												<div class="modal-footer">\
													<button type="button" class="btn btn-primary" id="save-tooth-setting">Simpan</button>\
												</div>\
											</div>\
										</div>\
									</div>\
								</div>\
								<div  class="row">\
									<div class="pull-right">\
										<div class="col-xs-12">\
											<button class="btn btn-primary btn-lg"  type="submit" id="btnsimpan" name="btnsimpan" > Simpan</button>\
											<button class="btn btn-info btn-lg"  type="button" id="batal" >Batal</button>\
											</button>\
										</div>\
									</div>\
								</div>\
								</form>\
							</div>\
						</div>\
					</div>';
				
					$("#subpage").append(tes);
					//reload datepicker
					$('#dtptanggal').datepicker();
					
					$(".cmb").select2();
					
					//tombol batal untuk reload div view
					$("#batal").off("click").on("click", function(e){
						document.getElementById("subpage").innerHTML="";
						$("#subpage").load('tindakanirj #view');
						//location.reload(); 
					});
				
					var $odontogram = $('#odontogram_<?php echo $timestamp; ?>.odontogram-input').szToothCanvas({
						responsive: true,
					}).on('click', function(e){
						var toothID = $(this).szToothCanvas('getNearestTooth', e.offsetX, e.offsetY);
						var toothCondition = $(this).szToothCanvas('getToothConditions');
						if (toothID) {
							tID = toothID.substr(1, 3);
							quadran = toothID.substr(1, 1);
							
							$('#odontogram-modal-<?php echo $timestamp; ?>').attr('tooth-id', toothID);
							$('[odontogram]').prop('checked', false);
							$('.odontogram-checkbox').show();
							
							if (quadran == '3' || quadran == '4' || quadran == '7' || quadran == '8') {
								$('.odontogram-checkbox [odontogram][value=karies_palatal]').parent().hide();
							} else {
								$('.odontogram-checkbox [odontogram][value=karies_palatal]').parent().show();
							}
							
							if (quadran == '1' || quadran == '2' || quadran == '5' || quadran == '6') {
								$('.odontogram-checkbox [odontogram][value=karies_lingual]').parent().hide();
							} else {
								$('.odontogram-checkbox [odontogram][value=karies_lingual]').parent().show();
							}
							
							for (key in toothCondition[toothID]) {
								var cond = toothCondition[toothID][key];
								$('[odontogram][value=' + cond + ']').prop('checked', true);
							}
							$('#odontogram-modal-<?php echo $timestamp; ?> .modal-title').html('Gigi ' + tID);
							$('#odontogram-modal-<?php echo $timestamp; ?>').modal('show');
						}
					});
				setDescription('.kajian-gilut[timestamp="<?php echo $timestamp; ?>"]', $odontogram.szToothCanvas('getToothDescriptions'));
				
			}else if (document.getElementById("btninput").value == "linktindakanrs")
			{
				document.getElementById("subpage").innerHTML="";
				var tes = '<form name="frmirjequipment" id="frmirjequipment" method="post" class="frmirjequipment" onsubmit="simpanequipment();return false;" enctype="multipart/form-data">\
				<div class="panel panel-transparent">\
					<div class="panel-heading">\
						<div class="panel-title">Equipment\
						</div>\
						<div class="tools">\
							<a class="collapse" href="javascript:;"></a>\
							<a class="config" data-toggle="modal" href="#grid-config"></a>\
							<a class="reload" href="javascript:;"></a>\
							<a class="remove" href="javascript:;"></a>\
						</div>\
					</div>\
					<div class="panel-body">\
						<div id="kotak">\
							<input class="hidden" type="text" name="txtrm" value="1" readonly="">\
							<div class="row">\
								<div class="col-sm-6">\
									<div class="form-group form-group-default required ">\
										<label>Equipment</label>\
										<input type="text" class="form-control" name="txtequipment" id="txtequipment" required>\
									</div>\
									<div class="form-group form-group-default required ">\
										<label>Dokter</label>\
										<input type="text" class="form-control" name="txtdokter" id="txtdokter" required>\
									</div>\
									<div class="form-group form-group-default input-group">\
										<label>Tanggal</label>\
										<input type="text" class="form-control" data-date-format="yyyy-mm-dd" placeholder="Pilih Tanggal" name="dtptanggal" id="dtptanggal">\
										<span class="input-group-addon">\
											<i class="fa fa-calendar"></i>\
										</span>\
									</div>\
								</div>\
								<div class="col-sm-6">\
									<div class="form-group form-group-default required ">\
										<label>Harga</label>\
										<input type="text" class="form-control" name="txtharga" id="txtharga" required>\
									</div>\
									<div class="form-group form-group-default required ">\
										<label>Qty</label>\
										<input type="text" class="form-control" name="txtqty" id="txtqty" required>\
									</div>\
								</div>\
							</div>\
						</div>\
					</div>\
				</div>\
				<div class="panel panel-transparent">\
					<div class="panel-heading">\
						<div class="panel-title">Obat Ruangan\
						</div>\
						<div class="tools">\
							<a class="collapse" href="javascript:;"></a>\
							<a class="config" data-toggle="modal" href="#grid-config"></a>\
							<a class="reload" href="javascript:;"></a>\
							<a class="remove" href="javascript:;"></a>\
						</div>\
					</div>\
					<div class="panel-body">\
						<div id="kotak">\<input class="hidden" type="text" name="txtrm" value="1" readonly="">\
							<div class="row">\
								<div class="col-sm-6">\
									<div class="row">\
										<div class="col-sm-9">\
											<div class="form-group form-group-default form-group-default-select2">\
												<label class="">Pilih Depo</label>\
												<select class="cmb full-width" data-placeholder="Pilih Depo" data-init-plugin="select2" name="cmbdepo">\
													<optgroup>\
														<option value=""></option>\
														<option value="UTAMA">UTAMA</option>\
														<option value="SEKUNDER">SEKUNDER</option>\
													</optgroup>\
												</select>\
											</div>\
										</div>\
										<div class="col-sm-2">\
											<button type="button" class="btn btn-primary btn-cons">Paket</button>\
										</div>\
										<br>\
									</div>\
									<div class="form-group form-group-default required ">\
										<label>Obat</label>\
										<input type="text" class="form-control" name="txtobat" id="txtobat" required>\
									</div>\
									<div class="form-group form-group-default required ">\
										<label>Satuan</label>\
										<input type="text" class="form-control" name="txtsatuan" id="txtsatuan" required>\
									</div>\
								</div>\
								<div class="col-sm-6">\
									<div class="form-group form-group-default input-group">\
										<label>Tanggal</label>\
										<input type="text" class="form-control" data-date-format="yyyy-mm-dd" placeholder="Pilih Tanggal" name="dtptanggal" id="dtptanggal">\
										<span class="input-group-addon">\
											<i class="fa fa-calendar"></i>\
										</span>\
									</div>\
									<div class="form-group form-group-default required ">\
										<label>Dokter</label>\
										<input type="text" class="form-control" name="txtdokter" id="txtdokter" required>\
									</div>\
									<div class="form-group form-group-default required ">\
										<label>Qty</label>\
										<input type="text" class="form-control" name="txtqty" id="txtqty" required>\
									</div>\
								</div>\
							</div>\
							<div  class="row">\
								<div class="pull-right">\
									<div class="col-xs-12">\
										<button class="btn btn-primary btn-lg"  type="submit" id="btnsimpan" name="btnsimpan" > Simpan</button>\
										<button class="btn btn-info btn-lg"  type="button" id="batal" >Batal</button>\
										</button>\
									</div>\
								</div>\
							</div>\
						</div>\
					</div>\
				</div>\
				</form>';
				
				$("#subpage").append(tes);
				
				//reload datepicker
				$('#dtptanggal').datepicker();
				
				$(".cmb").select2();
				
				//tombol batal untuk reload div view
				$("#batal").off("click").on("click", function(e){
					document.getElementById("subpage").innerHTML="";
					$("#subpage").load('tindakanirj #view');
					//location.reload(); 
				});
				
				
			}else if (document.getElementById("btninput").value == "linkrujuk")
			{
				document.getElementById("subpage").innerHTML="";
				var tes = '<div class="panel panel-transparent">\
					<div class="panel-heading">\
						<div class="panel-title">Input data Rujuk IRJ\
						</div>\
						<div class="tools">\
							<a class="collapse" href="javascript:;"></a>\
							<a class="config" data-toggle="modal" href="#grid-config"></a>\
							<a class="reload" href="javascript:;"></a>\
							<a class="remove" href="javascript:;"></a>\
						</div>\
					</div>\
					<div class="panel-body">\
						<div id="kotak">\
							<form name="frmirjrujuk" id="frmirjrujuk" method="post" class="frmirjrujuk" onsubmit="simpanrujuk();return false;" enctype="multipart/form-data">\
							<input class="hidden" type="text" name="txtrm" value="1" readonly="">\
							<div class="row">\
								<div class="col-sm-6">\
									<div class="form-group form-group-default form-group-default-select2">\
										<label class="">Instalasi</label>\
										<select class="cmb full-width" data-placeholder="Pilih Instalasi" data-init-plugin="select2" name="cmbinstalasi">\
											<optgroup>\
												<option value=""></option>\
												<option value="UTAMA">UTAMA</option>\
												<option value="SEKUNDER">SEKUNDER</option>\
											</optgroup>\
										</select>\
									</div>\
									<div class="form-group form-group-default form-group-default-select2">\
										<label class="">Poli</label>\
										<select class="cmb full-width" data-placeholder="Pilih Poli" data-init-plugin="select2" name="cmbpoli">\
											<optgroup>\
												<option value=""></option>\
												<option value="UTAMA">UTAMA</option>\
												<option value="SEKUNDER">SEKUNDER</option>\
											</optgroup>\
										</select>\
									</div>\
									<div class="form-group form-group-default required ">\
										<label>No. SEP</label>\
										<input type="text" class="form-control" name="txtnosep" id="txtnosep" required>\
									</div>\
								</div>\
								<div class="col-sm-6">\
									<div class="form-group form-group-default required ">\
										<label>Dokter</label>\
										<input type="text" class="form-control" name="txtdokter" id="txtdokter" required>\
									</div>\
									<div class="form-group form-group-default input-group">\
										<label>Tanggal Rujukan</label>\
										<input type="text" class="form-control" data-date-format="yyyy-mm-dd" placeholder="Pilih Tanggal Rujukan" name="dtptanggal" id="dtptanggal">\
										<span class="input-group-addon">\
											<i class="fa fa-calendar"></i>\
										</span>\
									</div>\
								</div>\
							</div>\
							<div  class="row">\
								<div class="pull-right">\
									<div class="col-xs-12">\
										<button class="btn btn-primary btn-lg"  type="submit" id="btnsimpan" name="btnsimpan" > Rujuk</button>\
										<button class="btn btn-info btn-lg"  type="button" id="batal" >Batal</button>\
										</button>\
									</div>\
								</div>\
							</div>\
							</form>\
						</div>\
					</div>\
				</div>';
				
				$("#subpage").append(tes);
				
				//reload datepicker
				$('#dtptanggal').datepicker();
				
				$(".cmb").select2();
				
				//tombol batal untuk reload div view
				$("#batal").off("click").on("click", function(e){
					document.getElementById("subpage").innerHTML="";
					$("#subpage").load('tindakanirj #view');
					//location.reload(); 
				});
			}else{
				alert(document.getElementById("btninput").value);
				
			}
		});
		
	});
})(window.jQuery);
</script>

 <script type="text/javascript">
  function simpantindakan()
 {
			var data = $('#frmirjtindakan').serialize();
			$.ajax({
                type:"POST",
                url:"{{ url('Tindakanirj/simpantindakan') }}",
                data:data,
                success:function(response)
				{
					if(response==1)
					{
						swal({ 
                            title: "Transaksi Berhasil!", 
                            text: "I will close in 2 seconds.",
                            timer: 2000,
                            type: "success"
									
                        }); 
						//window.location.href='http://localhost/aplous/pasien';
						location.reload();
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
 
 function simpandiagnosa()
 {
			var data = $('#frmirjdiagnosa').serialize();
			$.ajax({
                type:"POST",
                url:"{{ url('Polianak/simpandiagnosa') }}",
                data:data,
                success:function(response)
				{
					if(response==1)
					{
						swal({ 
                            title: "Transaksi Berhasil!", 
                            text: "I will close in 2 seconds.",
                            timer: 2000,
                            type: "success"
									
                        }); 
						//window.location.href='http://localhost/aplous/pasien';
						location.reload();
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
 
 function simpanequipment()
 {
			var data = $('#frmirjequipment').serialize();
			$.ajax({
                type:"POST",
                url:"{{ url('Tindakanirj/simpanequipment') }}",
                data:data,
                success:function(response)
				{
					if(response==1)
					{
						swal({ 
                            title: "Transaksi Berhasil!", 
                            text: "I will close in 2 seconds.",
                            timer: 2000,
                            type: "success"
									
                        }); 
						//window.location.href='http://localhost/aplous/pasien';
						location.reload();
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
 
 function simpanobat()
 {
			var data = $('#frmobat').serialize();
			$.ajax({
                type:"POST",
                url:"{{ url('Polianak/simpanobat') }}",
                data:data,
                success:function(response)
				{
					if(response==1)
					{
						swal({ 
                            title: "Transaksi Berhasil!", 
                            text: "I will close in 2 seconds.",
                            timer: 2000,
                            type: "success"
									
                        }); 
						//window.location.href='http://localhost/aplous/pasien';
						location.reload();
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
 
 function simpanrujuk()
 {
			var data = $('#frmirjrujuk').serialize();
			$.ajax({
                type:"POST",
                url:"{{ url('Tindakanirj/simpanrujuk') }}",
                data:data,
                success:function(response)
				{
					if(response==1)
					{
						swal({ 
                            title: "Transaksi Berhasil!", 
                            text: "I will close in 2 seconds.",
                            timer: 2000,
                            type: "success"
									
                        }); 
						//window.location.href='http://localhost/aplous/pasien';
						location.reload();
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
 
 function simpanstatus()
 {
			var data = $('#frmirjstatus').serialize();
			$.ajax({
                type:"POST",
                url:"{{ url('Tindakanirj/simpanstatus') }}",
                data:data,
                success:function(response)
				{
					if(response==1)
					{
						swal({ 
                            title: "Transaksi Berhasil!", 
                            text: "I will close in 2 seconds.",
                            timer: 2000,
                            type: "success"
									
                        }); 
						//window.location.href='http://localhost/aplous/pasien';
						location.reload();
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
 
<script>
function supernumeraryteethFunction(x) {
    var whichSelected = x.selectedIndex;
    var sel = x.options[whichSelected].text;
	if (sel == 'TIDAK ADA')
	{
		document.getElementById('divsupernumeraryteeth').style.display = "none";
	}else if (sel == 'ADA')
	{
		document.getElementById('divsupernumeraryteeth').style.display = "block";
	}
    //var elem = document.getElementById("mySpan");
    //elem.style.display = sel;
}
function diasternaFunction(x) {
    var whichSelected = x.selectedIndex;
    var sel = x.options[whichSelected].text;
	if (sel == 'TIDAK ADA')
	{
		document.getElementById('divdiasterna').style.display = "none";
	}else if (sel == 'ADA')
	{
		document.getElementById('divdiasterna').style.display = "block";
	}
    //var elem = document.getElementById("mySpan");
    //elem.style.display = sel;
}
function gigianomaliFunction(x) {
    var whichSelected = x.selectedIndex;
    var sel = x.options[whichSelected].text;
	if (sel == 'TIDAK ADA')
	{
		document.getElementById('divgigianomali').style.display = "none";
	}else if (sel == 'ADA')
	{
		document.getElementById('divgigianomali').style.display = "block";
	}
    //var elem = document.getElementById("mySpan");
    //elem.style.display = sel;
}
</script>
{% endblock %}
