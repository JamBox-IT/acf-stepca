<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Add Provisioner Result</h1>

<% if view.success then %>
<div class="alert alert-success">
	<h4>Provisioner Added Successfully!</h4>
	<p><%= html.html_escape(view.success.value) %></p>

	<% if view.prov_password then %>
	<div style="margin-top: 20px; padding: 15px; background-color: #fff; border: 2px dashed #3c763d; border-radius: 4px;">
		<h5 style="color: #a94442; margin-top: 0;"><strong><i class="icon-warning-sign"></i> IMPORTANT: SECURITY KEY</strong></h5>
		<p>This is the password for your new JWK provisioner. <strong>Copy it now.</strong> It is only displayed once and cannot be retrieved through this web interface again.</p>
		<div class="input-group">
			<input type="text" class="form-control" id="copy-pass" value="<%= html.html_escape(view.prov_password.value) %>" readonly style="font-family: monospace; background-color: #eee;">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button" onclick="copyToClipboard()">Copy</button>
			</span>
		</div>
	</div>

	<script>
	function copyToClipboard() {
		var copyText = document.getElementById("copy-pass");
		copyText.select();
		copyText.setSelectionRange(0, 99999);
		document.execCommand("copy");
		alert("Password copied to clipboard!");
	}
	</script>
	<% end %>

	<div style="margin-top: 15px; padding: 10px; border-top: 1px solid rgba(0,0,0,0.1);">
		<p><strong>Apply changes:</strong></p>
		<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/restart") %>" 
		   class="btn btn-success btn-sm">
			<i class="icon-refresh"></i> <%= view.is_running and "Reload" or "Start" %> step-ca Now
		</a>
	</div>
</div>

<% elseif view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong>
	<pre style="background: transparent; border: none; padding: 0; margin-top: 10px; color: inherit; font-family: inherit; font-size: inherit; white-space: pre-wrap; overflow-wrap: break-word;"><%= html.html_escape(view.error.value) %></pre>
</div>

<div class="well well-sm">
	<strong>Debug info:</strong>
	<pre><%= html.html_escape(view.debug_cmd and view.debug_cmd.value or "No debug info captured") %></pre>
</div>
<% end %>

<div class="form-group" style="margin-top: 20px;">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/provisioners") %>"
		class="btn btn-primary">
		<i class="icon-arrow-left"></i> Back to Provisioners
	</a>
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/addprovisioner") %>"
		class="btn btn-default" style="margin-left: 10px;">
		<i class="icon-plus"></i> Add Another Provisioner
	</a>
</div>
