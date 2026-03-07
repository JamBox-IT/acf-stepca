<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Delete Provisioner Result</h1>

<% if view.success then %>
<div class="alert alert-success">
	<strong>Success!</strong> <%= html.html_escape(view.success.value) %>
	<% if view.restart_required then %>
	<div style="margin-top: 15px; padding: 10px; border-top: 1px solid rgba(0,0,0,0.1);">
		<p><strong>Apply changes:</strong></p>
		<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/restart") %>" 
		   class="btn btn-success btn-sm"
		   style="display: inline-block; padding: 5px 10px; font-size: 12px; color: #fff; background-color: #5cb85c; border: 1px solid #4cae4c; border-radius: 3px; text-decoration: none;">
			<i class="icon-refresh"></i> <%= view.is_running and "Reload" or "Start" %> step-ca Now
		</a>
	</div>
	<% end %>
</div>

<% if view.output and view.output.value and view.output.value ~= "" then %>
<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">Command Output</h3>
	</div>
	<div class="panel-body">
		<pre><%= html.html_escape(view.output.value) %></pre>
	</div>
</div>
<% end %>

<% elseif view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<% end %>

<div class="form-group" style="margin-top: 20px;">
	<button type="button" class="btn btn-primary" onclick="window.location.href='<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/provisioners") %>'"
		style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #fff; background-color: #337ab7; border: 1px solid #2e6da4; border-radius: 4px; text-decoration: none;">
		<i class="icon-arrow-left"></i> Back to Provisioners
	</button>
</div>
