<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Create New Client Certificate</h1>

<% if view.error then %>
<div class="alert alert-danger">
	<strong>Error:</strong> <%= html.html_escape(view.error.value) %>
</div>
<% end %>

<% if view.success then %>
<div class="alert alert-success">
	<h4>Client Certificate Created Successfully!</h4>
	<p>The certificate has been created and is ready for use.</p>
    <pre>
    <strong>Client Certificate:</strong>
    <%= html.html_escape(view.cert_pem.value) %>

    <strong>Private Key:</strong>
    <%= html.html_escape(view.key_pem.value) %>

    <strong>Root CA Certificate:</strong>
    <%= html.html_escape(view.root_ca.value) %>
    </pre>
    <h4>Installation Instructions</h4>
    <pre><%= html.html_escape(view.instructions.value) %></pre>
</div>
<div class="form-group">
	<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/clients") %>"
		class="btn btn-primary">
		View All Clients
	</a>
</div>
<% else %>

<form method="POST" action="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/docreate_client") %>">

	<fieldset>
		<legend>Client Certificate Information</legend>

		<div class="form-group">
			<label for="client_name">Client Name *</label>
			<%= htmlviewfunctions.displayformitem(view.client_name) %>
			<p class="help-block">Unique identifier for the client (e.g., netapp-cluster01, my-laptop)</p>
		</div>

		<div class="form-group">
			<label for="client_type">Client Type</label>
			<%= htmlviewfunctions.displayformitem(view.client_type) %>
			<p class="help-block">Select the type of client to generate instructions for</p>
		</div>

		<div class="form-group">
			<label for="validity_days">Validity Period (Days)</label>
			<%= htmlviewfunctions.displayformitem(view.validity_days) %>
			<p class="help-block">How long the certificate will be valid</p>
		</div>

		<div class="form-group">
			<label for="description">Description</label>
			<%= htmlviewfunctions.displayformitem(view.description) %>
			<p class="help-block">Optional description or notes</p>
		</div>

	</fieldset>

	<div class="form-group">
		<button type="submit" class="btn btn-primary">
			<i class="icon-ok"></i> Create Client Certificate
		</button>
		<a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/clients") %>"
			class="btn btn-default">
			<i class="icon-remove"></i> Cancel
		</a>
	</div>

</form>

<% end %>
