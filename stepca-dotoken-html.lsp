<% local view, viewlibrary, page_info = ... %>
<% html = require("acf.html") %>

<%
local prov_name_val = ""
if view.prov_name and view.prov_name.value then
	prov_name_val = ": " .. html.html_escape(view.prov_name.value)
end
%>

<h1>Token Result<%= prov_name_val %></h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value or "Unknown error") %>
</div>
<div class="form-group">
	<button type="button" class="btn btn-default" onclick="window.location.href='<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/provisioners") %>'"
		style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #333; background-color: #fff; border: 1px solid #ccc; border-radius: 4px; text-decoration: none;">
		Back to Provisioners
	</button>
</div>
<% else %>

<div class="alert alert-success">
	<strong>Success!</strong> Your token has been generated for <strong><%= html.html_escape((view.subject and view.subject.value) or "unknown subject") %></strong>.
</div>

<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Generated Token (JWT)</h3>
	</div>
	<div class="panel-body">
		<p>This token is valid for 5 minutes and can be used to request a certificate.</p>
		<div class="form-group">
			<textarea id="token-box" class="form-control" rows="8" readonly style="font-family: monospace; background-color: #f8f8f8;"><%= html.html_escape((view.token and view.token.value) or "no token generated") %></textarea>
		</div>
		<button type="button" class="btn btn-info" onclick="copyToken()">
			<i class="icon-copy"></i> Copy Token to Clipboard
		</button>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Usage Example</h3>
	</div>
	<div class="panel-body">
		<p>On your client machine, run the following command to get your certificate:</p>
		<pre style="background-color: #eee;">step ca certificate "<%= html.html_escape((view.subject and view.subject.value) or "subject") %>" cert.crt cert.key --token [PASTE_TOKEN_HERE]</pre>
	</div>
</div>

<div class="form-group" style="margin-top: 20px;">
	<button type="button" class="btn btn-default" onclick="window.location.href='<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/provisioners") %>'"
		style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #333; background-color: #fff; border: 1px solid #ccc; border-radius: 4px; text-decoration: none;">
		Back to Provisioners
	</button>
</div>

<script>
function copyToken() {
	var copyText = document.getElementById("token-box");
	if (copyText) {
		copyText.select();
		copyText.setSelectionRange(0, 99999);
		document.execCommand("copy");
		alert("Token copied to clipboard!");
	}
}
</script>

<% end %>
