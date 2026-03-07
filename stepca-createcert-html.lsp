<% local view, viewlibrary, page_info = ... %>
<% htmlviewfunctions = require("htmlviewfunctions") %>
<% html = require("acf.html") %>

<h1>Create New Certificate</h1>

<% if view.error then %>
<div class="alert alert-danger">
    <strong>Error:</strong>
    <pre style="background: transparent; border: none; padding: 0; margin-top: 10px; color: inherit; font-family: inherit; font-size: inherit; white-space: pre-wrap; overflow-wrap: break-word;"><%= html.html_escape(view.error.value) %></pre>
</div>
<% end %>

<% if view.success then %>
<div class="alert alert-success">
    <h4>Certificate Created Successfully!</h4>
    <p>Certificate: <%= html.html_escape(view.cert_path.value) %></p>
    <p>Private Key: <%= html.html_escape(view.key_path.value) %></p>
</div>
<div class="form-group">
    <a href="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/listcerts") %>"
        class="btn btn-primary">
        View All Certificates
    </a>
</div>
<% else %>

<form method="POST" action="<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller .. "/docreate") %>">

    <fieldset>
        <legend>Certificate Information</legend>

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="common_name"><%= html.html_escape(view.common_name.label) %></label>
            <input type="text" id="common_name" name="common_name" value="<%= html.html_escape(view.common_name.value) %>" size="50">
            <br><small style="color: #777; font-size: 85%;"><%= html.html_escape(view.common_name.descr) %></small>
        </div>

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="cert_profile"><%= html.html_escape(view.cert_profile.label) %></label>
            <select id="cert_profile" name="cert_profile" style="width: auto; max-width: 300px;">
                <% for _, opt in ipairs(view.cert_profile.option) do %>
                <option value="<%= html.html_escape(opt) %>" <%= opt == view.cert_profile.value and "selected" or "" %>><%= html.html_escape(opt) %></option>
                <% end %>
            </select>
            <br><small style="color: #777; font-size: 85%;"><%= html.html_escape(view.cert_profile.descr) %></small>
        </div>

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="cert_template"><%= html.html_escape(view.cert_template.label) %></label>
            <select id="cert_template" name="cert_template" style="width: auto; max-width: 300px;">
                <% for _, opt in ipairs(view.cert_template.option) do %>
                <option value="<%= html.html_escape(opt) %>" <%= opt == view.cert_template.value and "selected" or "" %>><%= html.html_escape(opt) %></option>
                <% end %>
            </select>
            <br><small style="color: #777; font-size: 85%;"><%= html.html_escape(view.cert_template.descr) %></small>
        </div>

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="san_list"><%= html.html_escape(view.san_list.label) %></label>
            <input type="text" id="san_list" name="san_list" value="<%= html.html_escape(view.san_list.value) %>" size="50">
            <br><small style="color: #777; font-size: 85%;"><%= html.html_escape(view.san_list.descr) %></small>
        </div>

        <% if view.provisioner then %>
        <div class="form-group" style="margin-bottom: 20px;">
            <label for="provisioner"><%= html.html_escape(view.provisioner.label) %></label>
            <select id="provisioner" name="provisioner" style="width: auto; max-width: 300px;">
                <% for _, opt in ipairs(view.provisioner.option) do %>
                <option value="<%= html.html_escape(opt) %>" <%= opt == view.provisioner.value and "selected" or "" %>><%= html.html_escape(opt) %></option>
                <% end %>
            </select>
            <br><small style="color: #777; font-size: 85%;"><%= html.html_escape(view.provisioner.descr) %></small>
        </div>
        <% end %>

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="validity_days"><%= html.html_escape(view.validity_days.label) %></label>
            <input type="text" id="validity_days" name="validity_days" value="<%= html.html_escape(view.validity_days.value) %>" size="10">
            <br><small style="color: #777; font-size: 85%;"><%= html.html_escape(view.validity_days.descr) %></small>
        </div>

        <div class="form-group" style="margin-bottom: 20px;">
            <label for="key_size"><%= html.html_escape(view.key_size.label) %></label>
            <select id="key_size" name="key_size" style="width: auto; max-width: 150px;">
                <% for _, opt in ipairs(view.key_size.option) do %>
                <option value="<%= html.html_escape(opt) %>" <%= opt == view.key_size.value and "selected" or "" %>><%= html.html_escape(opt) %></option>
                <% end %>
            </select>
            <br><small style="color: #777; font-size: 85%;"><%= html.html_escape(view.key_size.descr) %></small>
        </div>
    </fieldset>

    <div class="form-group" style="margin-top: 30px;">
        <button type="submit" class="btn btn-primary">
            <i class="icon-ok"></i> Create Certificate
        </button>
        <button type="button" class="btn btn-default" onclick="window.location.href='<%= html.html_escape(page_info.script .. page_info.prefix .. page_info.controller) %>'">
            <i class="icon-remove"></i> Cancel
        </button>
    </div>

</form>

<% end %>
