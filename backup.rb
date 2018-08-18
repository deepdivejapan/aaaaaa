<% @events.each do |event| %>
        <div class= "box">
          <%= image_tag event.image , :size =>'240x240' %>
        <div class="event_list">
          <h2><%=event.title %></h2>
          <h4><%= event.place %></h4>
          <%= event.event_date %>
          <br><%=link_to '記事を読む', event_path(event.id) %>
          
        <% if event.allow == true  %>  
          <button type="button" class="btn btn-default" btn-lg><%= link_to "戻す", back_managers_path(id: event.id), method: :post%></button>
        <% else %>
          <button type="button" class="btn btn-success" btn-lg><%= link_to "承認", allow_managers_path(id: event.id), method: :post%></button>
        <% end %>
        </div> 





          <div class="input-group">
              <label class="input-group-btn">
                  <span class="btn btn-info">
                      画像を選択する<%=f.file_field :image, id: :post_image, multiple: true%>
                  </span>
              </label>
          </div>


<form accept-charset="UTF-8" action="/users" class="new_user" id="new_user" method="post">
  <div class="form-group">
    <label for="user_email">Email</label>
    <input class="form-control" id="user_email" name="user[email]" type="email">
  </div>
  <div class="form-group">
    <label for="user_password">Password</label>
    <input class="form-control" id="user_password" name="user[password]" type="password">
  </div>
  <div class="form-check">
    <input name="user[remember_me]" type="hidden" value="0">
    <input class="form-check-input" id="user_remember_me" name="user[remember_me]" type="checkbox" value="1">
    <label class="form-check-label" for="user_remember_me">Remember me</label>
  </div>
  <input class="btn btn-secondary" name="commit" type="submit" value="Log In">
</form>