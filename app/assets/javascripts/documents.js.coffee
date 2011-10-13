jQuery ->

  bottom_buttons = ->
    $("#thegrid").jqGrid "navButtonAdd", "#pager", 
      caption: "Columns"
      title: "Reorder Columns"
      onClickButton: ->
        $("#thegrid").jqGrid "columnChooser"

    $("#thegrid").jqGrid "navButtonAdd", "#pager", 
      caption: "Toggle"
      title: "Toggle Search Toolbar"
      buttonicon: "ui-icon-pin-s"
      onClickButton: ->
        $("#thegrid")[0].toggleToolbar()

    $("#thegrid").jqGrid "navButtonAdd", "#pager", 
      caption: "Clear"
      title: "Clear Search"
      buttonicon: "ui-icon-refresh"
      onClickButton: ->
        $("#thegrid")[0].clearToolbar()

    $("#thegrid").jqGrid "navButtonAdd", "#pager", 
      caption: "Show"
      title: "Show Selected Document"
      buttonicon: "ui-icon-arrow-4"
      onClickButton: ->
        unless BONES.lastsel == " "
          location.href = "/documents/" + BONES.lastsel
        else
          alert "You need to select a Document to view!"
        false

    $("#thegrid").jqGrid "gridResize", 
      minWidth: 350
      maxWidth: 1000
      minHeight: 100
      maxHeight: 1024

    $("#thegrid").jqGrid "filterToolbar"

  myselectrow = (id) ->
    if (id) and (id != BONES.lastsel)
      jQuery("#thegrid").jqGrid "restoreRow", BONES.lastsel  if BONES.lastsel
      BONES.lastsel = id
    jQuery("#thegrid").jqGrid "editRow", id, true, BONES.pickdates, "", "", "", BONES.updated_ok

  BONES.userights()

  cnames = [ "rid", "thumb", "file_name", "description", "comments" ]
  cmodel = [ 
    name: "rid"
    index: "id"
    width: 1
    hidden: true
    hidedlg: true
    sortable: false
    editable: true
  , 
    name: "thumb"
    index: "document_url_thumb"
    width: 40
    sortable: false
  , 
    name: "document_file_name"
    index: "document_file_name"
    width: 100
    sortable: true
  , 
    name: "description"
    index: "description"
    width: 160
    align: "left"
    sortable: true
  , 
    name: "comments"
    index: "comments"
    editable: true
    sorttype: "text"
    width: 100
  ]

  BONES.buildGrid "#thegrid", cnames, cmodel, 
    caption: "Documents"
    sortname: "document_file_name"
    sortdir: "asc"
    buildbuttons: bottom_buttons
    onselrow: myselectrow
