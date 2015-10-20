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

get '/lightbulb' do
  @person = params[:person]

  @answer = case @person
  when "software programmers"
    "None. That is a hardware issue."
  when "hardware folks"
    "None. They just have marketing portray the dead bulb as a feature."
  when "spammers"
    "None, but they'll offer to sell everybody in the world a quick and profitable method for doing it."
  when "Internet newsgroup users"
    "Fifty. One to do it and 49 to talk about it on alt.bulbs.d."
  when "support technicians"
    "We have an exact copy of the light bulb here, and it seems to be working fine. Can you tell me what kind of system you have? Ok. Now, exactly how dark is it? Ok, there could be four or five things wrong . . . have you tried the light switch?"
  when "webmasters"
    "404 (Not found)."
  when "AOLers"
    "What? You can change light bulbs?"  
  when "software testers"
    "We just notice the room is dark; we don't actually fix the problems." 
  when "Microsoft executives"
    "None, they will just redefine Darkness (tm) as the industry standard."
  when "apple enthusiasts"
    "They don't change the light bulb, they just buy a new house."
  when "Linux users"
    "One, but he'll take a weekend to rewire half the basement, constantly promising that you'll never need to change a lightbulb again. When he's done, it only lights up if you flip the switch in a certain way, and it's somehow Microsoft's fault when it doesn't." 
  end

  erb :lightbulb
end



