var lastsel,amiana,role,currentGrid;

$(window).load(function(){
	var flash_message = $("#flash_notice");
	if (flash_message != null) { flash_message.fadeTo(4000,0); }
});

var BONES = {
	userights:function(){
		amiana = (eval($("#amiana").val())); // am i an admin (or editor)
		var role = $("#marole").val();
	},
	white_space:function(str){
		if (str!=null)
		return (str.replace(/^\s*|\s*$/g,''));
		else
		return ""
	},
	pickdates:function (id){ 
		// $("#"+id+"_entered_date","#thegrid").datepicker({
		// 	dateFormat:"yy-mm-dd",
		// 	showButtonPanel: true,
		// 	onClose: function(dateText, inst) { 
		// 		$("#thegrid").saveRow(id,BONES.updated_ok);
		// 		return true;				
		// 	}
		// }); 
	},
	findari:function(myarray,seek) {	// find index of array where array[i][0]==seek
		i=0;
		for (a in myarray) {
			di=myarray[parseInt(a)];
			if (di.name==seek) {
				return i;
			}
			i=i+1;
		}
		return -1;	// not found!
	},
	updated_ok:function(id){
		$('#header_container').html("<h1>Attachments</h1><div id='flash_notice'>Record was successfully updated.</div>");
		$('#flash_notice').fadeTo(4000,0.5);
		return true
	},
 	buildGrid:function(grid, columnNames,columnModel,options){
		currentGrid = grid;
		options = options || {}
		var dataurl = options["dataurl"] || "/attachments/grid";
		var caption = options["caption"] || "myGrid";
		var role = options["role"] || false;
		var sortname = options["sortname"] || "production_date";
		var sortdir = options["sortdir"] || "asc";
		var rowsperpage = options["rowsperpage"] || 20;
		var datatopost = options["datatopost"] || {	};
		var pager = options["pager"] || "#pager";
		var onselrow = options["onselrow"] || function(id){ 
			if((id) && (id!==lastsel)){ 
				if (lastsel) {
					jQuery('#thegrid').jqGrid('restoreRow',lastsel);
				}
				lastsel=id; 
			} 
			orderid=jQuery("#thegrid").getRowData(id).rid;
			jQuery('#thegrid').jqGrid('editRow',id,true,BONES.pickdates,'','','',BONES.updated_ok);
		}			
		var $buildbuttons = options["buildbuttons"] || function(id){
			$(grid).jqGrid('navButtonAdd',pager,{ 
				caption: "Columns", title: "Reorder Columns", 
				onClickButton : function (){ 
					$(grid).jqGrid('columnChooser'); 
				} 
			});
			$(grid).jqGrid('navButtonAdd',pager,{
				caption:"Toggle",title:"Toggle Search Toolbar", 
				buttonicon :'ui-icon-pin-s', 
				onClickButton:function(){ $(grid)[0].toggleToolbar() }
			});
			$(grid).jqGrid('navButtonAdd',pager,{caption:"Clear",title:"Clear Search",buttonicon :'ui-icon-refresh', 
				onClickButton:function(){ $(grid)[0].clearToolbar() } });
			if (amiana) {
							$(grid).jqGrid('navButtonAdd',pager,{caption:"Edit",title:"Edit Selected Attachment",buttonicon :'ui-icon-pencil', 
							onClickButton:function(){
								// orderid=jQuery(grid).getRowData(lastsel).rid;
								$("#main_container").load("/attachments/edit/"+lastsel);
								// $.fn.colorbox({href:"/orders/edit/"+lastsel+"?cb=1",open:true,width:850,height:700,iframe:true});
								return false
							}});
						}
						$(grid).jqGrid('navButtonAdd',pager,{caption:"Show",title:"Show Selected Attachment",buttonicon :'ui-icon-arrow-4', 
						onClickButton:function(){ 
							// orderid=jQuery(grid).getRowData(lastsel).rid;
							$.fn.colorbox({href:"/attachments/show/"+lastsel+"?cb=1",open:true});
							return false
						}});
			
			$(grid).jqGrid('gridResize',{minWidth:350,maxWidth:1000,minHeight:100, maxHeight:1024});	
			$(grid).jqGrid('filterToolbar');
		}
		var colorow = options["colorow"] || null;
		var loadcomplete = options["loadcomplete"] || null;
		var footerrow = options["footerrow"] || false;
		var userdata = options["userdata"] || false;
		var userdataonfooter = options["userdataonfooter"] || false;

		try {
				$(grid).jqGrid({
					sortable: true, 
					postData: datatopost,
					url:dataurl, 
					autowidth:false,
					datatype: 'json',
					mtype: "post",
					closeAfterAdd: true,
					reloadAfterSubmit: true,
					colNames:columnNames,
					colModel :columnModel,
					pager: pager,
					rowNum:rowsperpage,
					rowList:[20,30,50,100,200],
					height: "auto",
					width: 950,
					sortname: sortname,
					sortorder: sortdir,
					viewrecords: true,
					gridview : false,
					gridToolbar:true,
					caption: caption,
					loadComplete: loadcomplete,
					footerrow: footerrow,
					userdata: userdata,
					userDataOnFooter: userdataonfooter,
					onSelectRow: onselrow,
					afterInsertRow: colorow,
					editurl: "/orders/updategrid"
				}).navGrid(pager,{edit:false,add:false,del:false,search:false});
				$buildbuttons();
			}
			catch (error) {
				// alert(error.message);
				return false;
			}
			return true; // successfully built jqGrid
	}
};
