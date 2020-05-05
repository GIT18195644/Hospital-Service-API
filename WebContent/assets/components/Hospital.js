$(document).ready(function()
{
	$("#alertSuccess").hide();
	$("#alertError").hide();
});

//SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();0
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validateItemForm();
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}

	// If valid------------------------
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";

	$.ajax(
	{
		url : "HospitalAPI",
		type : type,
		data : $("#formItem").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			 onItemSaveComplete(response.responseText, status);
		}
	});
});

function onItemSaveComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
 
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidItemIDSave").val("");
	$("#formItem")[0].reset();
}

//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
	$("#Hospital_name").val($(this).closest("tr").find('td:eq(0)').text());
	$("#Hospital_location").val($(this).closest("tr").find('td:eq(1)').text());
	$("#Register_no").val($(this).closest("tr").find('td:eq(2)').text());
	$("#Email").val($(this).closest("tr").find('td:eq(3)').text());
	$("#Phone").val($(this).closest("tr").find('td:eq(4)').text());
}); 

//REMOVE==========================================
$(document).on("click", ".btnRemove", function(event)
		{
		 $.ajax(
		 {
		 url : "HospitalAPI",
		 type : "DELETE",
		 data : "Hospital_id=" + $(this).data("itemid"),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 onItemDeleteComplete(response.responseText, status);
		 }
		 });
		});

function onItemDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

//CLIENT-MODEL================================================================
function validateItemForm()
{
	// CODE
	if ($("#Hospital_name").val().trim() == "")
	{
		return "Insert Hospital_name.";
	}
	// NAME
	if ($("#Hospital_location").val().trim() == "")
	{
		return "Insert Hospital_location.";
	}
	// PRICE-------------------------------
	if ($("#Register_no").val().trim() == "")
	{
		return "Insert Register_no.";
	}
	// is numerical value
	var tmpPrice = $("#Phone").val().trim();
	if (!$.isNumeric(tmpPrice))
	{
		return "Insert a numerical value.";
	}
	// DESCRIPTION------------------------
	if ($("#Email").val().trim() == "")
	{
		return "Insert Email.";
	}
	return true;
}
