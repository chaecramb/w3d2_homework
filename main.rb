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
  @first_number = params[:first_number]
  @second_number = params[:second_number]
  @operator = params[:operator]

  @result = @first_number.to_f ** @second_number.to_f if @first_number && @second_number 

  erb :power
end

get '/square_root' do
  @number = params[:number]


  @result = Math::sqrt(@number.to_f) if @number 

  erb :square_root
end

get '/converter' do
  @kilometres = params[:kilometres]
  @metres = params[:metres]
  @centimetres = params[:centimetres]

  if @kilometres 
    @miles = (@kilometres.to_f / 1.609344).round(2)
  end

  if @metres 
    @feet = (@metres.to_f / 0.3048).round(2)
  end

  if @centimetres
    @inches = (@centimetres.to_f / 2.54).round(2)
  end

  erb :converter
end
