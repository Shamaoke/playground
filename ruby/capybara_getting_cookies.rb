[ Capybara
    .current_session
    .driver
    .request
    .cookies,

  Rails
    .application
    .config
    .session_options
    .fetch(:key)

].then do |cookies, session_key|

  # Marshal.load( Base64.decode64 cookies.fetch session_key ).then do |session_data|
  #   expect( session_data.fetch 'author' ).to_be not_nil
  # end

  # Base64.decode64( cookies.fetch session_key ).then do |decoded_session_key|

  #   Marshal.load( decoded_session_key ).then do |session_data|
  #     expect( session_data.fetch 'author' ).to_be not_nil
  #   end

  # end

  cookies.fetch( session_key )           .then do |encoded_session_key|
  Base64.decode64( encoded_session_key ) .then do |decoded_session_key|
  Marshal.load( decoded_session_key )    .then do |session_data|
  session_data.fetch( 'author' )         .then do |session_field|

    expect( session_field ).to_be not_nil

  end end end end

  # ( session_key |> cookies.fetch |> Base64.decode64 |> Marshal.load ).then do |session_data|
  #   ('author' |> session_data.fetch |> expect).to_not be nil
  # end

  session_key |> cookies.fetch |> base64.decode64 |> Marshal.load |> .fetch 'author' |> expect |> .to_not_be nil

  cookies.fetch      session_key         then do |encoded_session_key|
  Base64.decode64    encoded_session_key then do |decoded_session_key|
  Marshal.load       decoded_session_key then do |session_data|
  session_data.fetch :author             then do |session_field|

  expect(session_field).to_be not_nil

  all

  # end end end end

  ( cookies.fetch      session_key         ).then do |encoded_session_key|
  ( Base64.decode64    encoded_session_key ).then do |decoded_session_key|
  ( Marshal.load       decoded_session_key ).then do |session_data|
  ( session_data.fetch :author             ).then do |session_field|

  ( expect session_field ).to not_be_nil
  end end end end

end

Step /^session data should be set$/ do

  [ Capybara
      .current_session
      .driver
      .request
      .cookies,

    Rails
      .application
      .config
      .session_options
      .fetch :key

  ].then do |cookies, session_key|

  ( cookies.fetch      session_key         ) .then do |encoded_session_key|
  ( Base64.decode64    encoded_session_key ) .then do |decoded_session_key|
  ( Marshal.load       decoded_session_key ) .then do |session_data|
  ( session_data.fetch :author             ) .then do |session_field|

  ( expect session_field ).to not_be_nil

    end end end end

  end

end


Step /^session data should be set$/ do

  [ Capybara
      .current_session
      .driver
      .request
      .cookies,

    Rails
      .application
      .config
      .session_options
      .fetch :key

  ].then do |cookies, session_key|

    cookies.fetch(session_key)           .then do |encoded_session_key|
    Base64.decode64(encoded_session_key) .then do |decoded_session_key|
    Marshal.load(decoded_session_key)    .then do |session_data|
    session_data.fetch(:author)          .then do |session_field|

    expect(session_field).to not_be_nil

    end end end end

    #  cookies.fetch        session_key         then do
    #  Base64.decode64     $encoded_session_key then do
    #  Marshal.load        $decoded_session_key then do
    # $session_data.fetch  :author              then do

    # (expect $session_field).to not_be_nil

    # end end end end

  end

end

Step /^session data should be set$/ do
  [ Capybara
      .current_session
      .driver
      .request
      .cookies,

    Rails
      .application
      .config
      .session_options
      .fetch :key ] |>

  .[0][.[1]] |> Base64.decode64 |> Marshal.load |> .fetch :author |> expect |> .to not nil

  _1[_2] |> Base64.decode64 |> Marshal.load |> .fetch :author |> expect(_1).to not nil

  _1[_2]
  |> Base64.decode64
  |> Marshal.load
  |> .fetch :author
  |> expect(_1).to not nil

  _1[_2]
  |> Base64.decode64
  |> Marshal.load
  |> .fetch :author
  |> expect
  |> .to not nil
end

Step /^session data should be set$/ do
  [ Capybara
      .current_session
      .driver
      .request
      .cookies,

    Rails
      .application
      .config
      .session_options
      .fetch :key ].then do |cookies, session_key|

    cookies.fetch(session_key).then { |encoded_session_key|
      Base64.decode64(encoded_session_key).then { |decoded_session_key|
        Marshal.load(decoded_session_key).then { |session_data|
          session_data.fetch(:author).then { |session_field|
            expect(session_field).then { |expectation|
              expectation.to_not be_nil } } } } }

  end

  alias |> then

  [ Capybara.current_session.driver.request.cookies,
    Rails.application.config.session_options.fetch :key ]
    |> _1.fetch _2
    |> Base64.decode64 _1
    |> Marshal.load _1
    |> _1.fetch :author
    |> expect _1
    |> _1.to_not be_nil
    => result

end

Step /^Session data should be set$/ do
  [
    Capybara.current_session.driver.request.cookies,
    Rails.application.config.session_options.fetch :key
  ]
    |> _1[_2]
    |> Base64.decode64
    |> Marshal.load
    |> .fetch :author
    |> expect
    |> .to not nil
end

Step /^Session data should be set$/ do
  [
    Capybara.current_session.driver.request.cookies,
    Rails.application.config.session_options.fetch :key
  ]
    |> -> cookes, session { cookies.fetch session }
    |> Base64.decode64
    |> Marshal.load
    |> -> session { session.fetch :author }
    |> expect
    |> -> expectation { expectation.to not nil }
end

Step /^Session data should be set$/ do
  [
    Capybara.current_session.driver.request.cookies,
    Rails.application.config.session_options.fetch :key
  ]
    -> cookes, session { cookies.fetch session }
    |> Base64.decode64
    |> Marshal.load
    -> session { session.fetch :author }
    |> expect
    -> expectation { expectation.to not nil }
end

Step /^Session data should be set$/ do
  [
    Capybara.current_session.driver.request.cookies,
    Rails.application.config.session_options.fetch :key
  ]
    |> -> cookes, session { cookies.fetch session }
    |> Base64.decode64
    |> Marshal.load
    |> -> session { session.fetch :author }
    |> expect
    |> -> expectation { expectation.to not nil }

  Pipeline.create
    [
      Capybara.current_session.driver.request.cookies,
      Rails.application.config.session_options.fetch :key
    ],
    _1.fetch _2,
    Base64.decode64 _1,
    Marshal.load _1,
    _1.fetch :author,
    expect _1,
    _1.to not nil
end

Step /^session data should be set$/ do
  [ Capybara
      .current_session
      .driver
      .request
      .cookies,

    Rails
      .application
      .config
      .session_options
      .fetch :key ],

  _1.fetch _2,
  Base64.decode64,
  Marshal.load,
  .fetch :author,
  expect,
  .to_not be_nil


  _1.fetch _2, Base64.decode64, Marshal.load, .fetch :author, expect, .to_not be_nil
end

def render(scene, image, screenWidth, screenHeight)
  screenHeight.times do |y|
    screenWidth.times do |x|
      color = self.traceRay(....)
      r, g, b = Color.toDrawingColor(color)
      image.set(x, y, StumpyCore::RGBA.from_rgb(r, g, b))
    end
  end
end

def render scene, image, screen_width, screen_height
  screen_height.times do |y|
    screen_width.times do |x|

      self.traceRay ... |> Color.to_drawing_color |> StumpyCore::RGBA.from_rgb _1, _2, _3 |> image.set x, y, _1

  end end

  screen_height.times do |y|
  screen_width.times  do |x|

      self.traceRay(...).then { |_1|
        Color.to_drawing_color(_1).then { |_1, _2, _3|
          StumpyCore::RGBA.from_rgb(r, g, b).then { |_1|
            image.set x, y, _1 } } }

  end end

end

1.. |> .take 10 |> .map { _1 * 2 } => x

let pipe left right = right left

let succ n = n + 1

pipe 1 succ #=> 2

alias pipe |>

1 |> succ #=> 2

###

require 'yaml'

_DATA_
  |> YAML.load_file
  => { :one, :two, :three }
  |> "${one}\n${two}\n${three}"

require 'wasmer'

[ Wasmer::Store.new, File.read 'simple.wasm', mode: 'rb' ]
  |> Wasmer::Module.new _1, _2
  |> Wasmer::Instance _1, nil
  |> _1.exports.sum.call 5, 37
  => result

puts result

[ Wasmer::Store.new, File.read 'simple.wasm', mode: 'rb' ].then do
  Wasmer::Module.new(_1, _2) .then do
  Wasmer::Instance(_1, nil)  .then do
  _.exports.sum.call(5, 37)  .then do
  _1 => result
end end end end

puts result

__END__
one: ok!
two: ok too!
three: ok free!

