<% local view, viewlibrary, page_info = ... %>
<% html = require("acf.html") %>

<h1>Edit Template: <%= html.html_escape(view.template_name.value) %></h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<% end %>

<% if view.success then %>
<div class="alert alert-success">
	<strong>Success!</strong> <%= html.html_escape(view.success.value) %>
</div>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/templates") %>" class="btn btn-primary">
		Back to Templates
	</a>
</div>
<% end %>

<form method="POST" action="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/savetemplate") %>">
	<input type="hidden" name="template_name" value="<%= html.html_escape(view.template_name.value) %>">

	<div class="form-group">
		<label for="content"><%= html.html_escape(view.content.label) %></label>
		<textarea id="content" name="content" rows="25" style="width: 100%; font-family: monospace; font-size: 13px; padding: 10px; border: 1px solid #ccc; border-radius: 4px; tab-size: 4;"><%= html.html_escape(view.content.value) %></textarea>
		<br><small style="color: #777;">Templates use Go text/template syntax and Sprig functions.</small>
	</div>

	<div class="form-group" style="margin-top: 20px;">
		<button type="submit" class="btn btn-primary">
			<i class="icon-save"></i> Save Changes
		</button>
		<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/templates") %>" class="btn btn-default">
			Cancel
		</a>
	</div>
</form>
