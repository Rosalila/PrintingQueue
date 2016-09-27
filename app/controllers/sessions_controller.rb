class SessionsController < ApplicationController
  def log_in
    email = params["email"]
    password = params["password"]

    uri = URI('http://kusuk.in/api/v1/users/sign_in')
    req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json'})
    req.body = {user:{email: email, password: password}}.to_json

    @res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      @response = JSON.parse(http.request(req).response.body)
      session['email'] = @response["user"]["email"]
      session['kusukin_id'] = @response["user"]["id"]
      session['authentication_token'] = @response["authentication_token"]
    end

    @user = User.find_by_kusukin_id(session['kusukin_id'])
    if !@user
      @user = User.new
      @user.email = session['email']
      @user.kusukin_id = session['kusukin_id']
      @user.save
    end
    session['id'] = @user.id
    redirect_to '/'
  end

  def sign_up
    email = params["email"]
    password = params["password"]

    uri = URI('http://kusuk.in/api/v1/users')
    req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json'})
    req.body = {user:{email: email, password: password}}.to_json

    @res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      @response = JSON.parse(http.request(req).response.body)
      session['email'] = @response["data"]["email"]
      session['kusukin_id'] = @response["data"]["id"]
      session['authentication_token'] = @response["data"]["authentication_token"]
    end

    @user = User.find_by_kusukin_id(session['kusukin_id'])
    if !@user
      @user = User.new
      @user.email = session['email']
      @user.kusukin_id = session['kusukin_id']
      @user.save
    end
    session['id'] = @user.id
    redirect_to '/'
  end

  def log_out
    session['email'] = nil
    session['kusukin_id'] = nil
    session['authentication_token'] = nil
    session['id'] = nil
    redirect_to '/'
  end

  def log_in_form
  end

  def sign_up_form
  end
end
