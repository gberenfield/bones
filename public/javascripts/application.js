var lastsel;

$(document).ready(function(){

	$("#header_container").corner();
	$(".sidebar_container a").corner();
	$(".sidebar_container").corner();

	$("#thegrid").jqGrid({
		sortable: true, 
		url:'/attachments/grid',
		autowidth:false,
		datatype: 'json',
		mtype: "post",
		// closeAfterAdd: true,
		// reloadAfterSubmit: true,
		colNames:['rid','name','description','comments'],
		colModel :[
		{name:'rid',index:'id', width:1,hidden:true,hidedlg:true,sortable:false,editable:true},
		{name:'name', index:'attachment_file_name', width:100,sortable:true},
		{name:'description', index:'description', width:160, align:'left',sortable:true}, 
		{name:'comments', index:'comments', editable:true,sorttype:'text',width:100}
		],
		pager: '#pager',
		rowNum:20,
		rowList:[20,30,50,100],
		height: 'auto', 
		width: 950,
		sortname: 'attachment_file_name',
		sortorder: 'asc',
		viewrecords: true,
		gridview : false,
		gridToolbar:true,
		caption: 'Attachments',
		onSelectRow: function(id){ 
			if((id) && (id!==lastsel)){ 
				if (lastsel) {
					jQuery('#thegrid').jqGrid('restoreRow',lastsel);
				}
				lastsel=id; 
			} 
			orderid=jQuery("#thegrid").getRowData(id).rid;
			jQuery('#thegrid').jqGrid('editRow',id,true);
		},
		editurl: "/attachments/updategrid"
	}).navGrid('#pager',{edit:false,add:false,del:false,search:false});
	
	$("#thegrid").jqGrid('navButtonAdd','#pager',{ caption: "Columns", title: "Reorder Columns", 
	onClickButton : function (){ $("#thegrid").jqGrid('columnChooser'); } });
	$("#thegrid").jqGrid('navButtonAdd',"#pager",{caption:"Toggle",title:"Toggle Search Toolbar", buttonicon :'ui-icon-pin-s', 
	onClickButton:function(){ $("#thegrid")[0].toggleToolbar() } });
	$("#thegrid").jqGrid('navButtonAdd',"#pager",{caption:"Clear",title:"Clear Search",buttonicon :'ui-icon-refresh', 
	onClickButton:function(){ $("#thegrid")[0].clearToolbar() } });
	$("#thegrid").jqGrid('navButtonAdd',"#pager",{caption:"Edit",title:"Edit Selected Order",buttonicon :'ui-icon-pencil', 
		onClickButton:function(){
			$("#main_container").load("/attachments/edit/"+lastsel);
			return false
		}
	});
	$("#thegrid").jqGrid('navButtonAdd',"#pager",{caption:"Show",title:"Show Selected Order",buttonicon :'ui-icon-arrow-4', 
		onClickButton:function(){ 
			$.fn.colorbox({href:"/attachments/show/"+lastsel+"?cb=1",open:true});
			return false
		}
	});
	$("#thegrid").jqGrid('gridResize',{minWidth:350,maxWidth:1000,minHeight:100, maxHeight:1024});	
	$("#thegrid").jqGrid('filterToolbar');

}); 

jQuery.ajaxSetup({'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}});