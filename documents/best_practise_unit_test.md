What should you test?

### Testing model 

### Testing service object 
### Testing Rails controllers with RSpec 

What was the response status code?
What was the response content type?
Did the controller render the expected template?
Did the controller render the expected Rails layout?
Did the controller set any flash messages?
Was any information inserted or deleted from the session?
Did the controller redirect the user to a new URL?

render_template 
```
expect(response).to render_template(:new)   # wraps assert_template
```
redirect_to
`expect(response).to redirect_to(location)   # wraps assert_redirected_to` 

have_http_status
`expect(response).to have_http_status(:created)`

be_a_new 
`expect(assigns(:teams)).to eq([team])`
### Testing view 
