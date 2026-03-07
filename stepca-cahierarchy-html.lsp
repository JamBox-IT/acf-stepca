<% local view, viewlibrary, page_info = ... %>
<% html = require("acf.html") %>

<h1>PKI Manager - CA Hierarchy</h1>

<% if view.root_ca then %>
<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">Root Certificate Authority</h3>
	</div>
	<div class="panel-body">
		<pre><%= html.html_escape(view.root_ca.value) %></pre>
	</div>
</div>
<% end %>

<% if view.intermediate_ca then %>
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">Intermediate Certificate Authority</h3>
	</div>
	<div class="panel-body">
		<pre><%= html.html_escape(view.intermediate_ca.value) %></pre>
	</div>
</div>
<% else %>
<div class="alert alert-info">
	<strong>Note:</strong> No intermediate CA is configured. This CA uses a flat hierarchy (Root CA issues all certificates).
</div>
<% end %>
