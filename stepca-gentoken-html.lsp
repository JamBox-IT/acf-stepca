<% local view, viewlibrary, page_info = ... %>
<% html = require("acf.html") %>

<%
local prov_name_val = ""
if view.prov_name and view.prov_name.value then
	prov_name_val = ": " .. html.html_escape(view.prov_name.value)
end
%>

<h1>Generate Token<%= prov_name_val %></h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<div class="form-group">
	<button type="button" class="btn btn-default" onclick="window.location.href='<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/provisioners") %>'">
		Back to Provisioners
	</button>
</div>
<% else %>

<form method="POST" action="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/dotoken") %>">
	<input type="hidden" name="prov_name" value="<%= html.html_escape((view.prov_name and view.prov_name.value) or "") %>">

	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">Token Details</h3>
		</div>
		<div class="panel-body">
			<p>Use this form to generate a temporary authorization token for a client.</p>
			
			<div class="form-group" style="margin-bottom: 20px;">
				<label for="subject"><%= html.html_escape(view.subject.label) %> *</label>
				<input type="text" id="subject" name="subject" value="<%= html.html_escape(view.subject.value) %>" class="form-control" placeholder="e.g., kanidm.local or 192.168.1.10" required>
				<small style="color: #777;"><%= html.html_escape(view.subject.descr) %></small>
			</div>

			<div class="form-group" style="margin-bottom: 20px;">
				<label for="prov_password"><%= html.html_escape(view.prov_password.label) %> *</label>
				<input type="password" id="prov_password" name="prov_password" class="form-control" required>
				<small style="color: #777;"><%= html.html_escape(view.prov_password.descr) %></small>
			</div>
		</div>
	</div>

	<div class="form-group" style="margin-top: 20px;">
		<button type="submit" class="btn btn-primary" style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #fff; background-color: #337ab7; border: 1px solid #2e6da4; border-radius: 4px; text-decoration: none;">
			<i class="icon-ticket"></i> Generate Token
		</button>
		<button type="button" class="btn btn-default" onclick="window.location.href='<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/provisioners") %>'"
			style="display: inline-block; padding: 6px 12px; font-size: 14px; color: #333; background-color: #fff; border: 1px solid #ccc; border-radius: 4px; text-decoration: none; margin-left: 10px;">
			Cancel
		</button>
	</div>
</form>

<% end %>
