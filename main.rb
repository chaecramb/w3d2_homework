require 'pry-byebug'
require 'sinatra'
require 'sinatra/contrib/all' if development?

get '/' do
  erb :home
end

get '/about_us' do
  erb :about_us
end

# get '/multiply/:x/:y' do
#   @result = params[:x].to_i * params[:y].to_i
#   erb :result
# end

get '/faqs' do
  erb :faqs
end

get '/calculate' do
  @first_number = params[:first_number].to_f
  @second_number = params[:second_number].to_f
  @operator = params[:operator]

  @result = case @operator
  when "+"
    @first_number + @second_number
  when "-"
    @first_number - @second_number
  when "/"
    @first_number / @second_number
  when "*"
    @first_number * @second_number
  end

  erb :result
end

get '/advanced_calculator' do
  @first_number = params[:first_number].to_f
  @second_number = params[:second_number].to_f
  @operator = params[:operator]

  # @result = case @operator
  # when "+"
  #   @first_number + @second_number
  # when "-"
  #   @first_number - @second_number
  # when "/"
  #   @first_number / @second_number
  # when "*"
  #   @first_number * @second_number
  # end

  erb :advanced_calculator
end

get '/power' do
  @first_number = params[:first_number].to_f
  @second_number = params[:second_number].to_f
  @operator = params[:operator]

  @result = @first_number ** @second_number

  erb :power
end