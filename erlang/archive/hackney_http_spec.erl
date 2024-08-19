-module(hackney_http_spec).
-include_lib("espec/include/espec.hrl").
-include("hackney_lib.hrl").

parse_response_correct_200_spec() ->
  Response = <<"HTTP/1.1 200 OK">>,
  St = #hparser{},
  {response, _Version, Status_int, Reason, _N_state} = hackney_http:parse_response_version(Response, St),
  ?expect_to_eq(Status_code, 200).

% -module(expectations).
correct_response(Response, Expected) ->
  Actual = http_lib:parse_response(Response),
  ?expect_to_eq(Actual, Expected).

% -module(spec).
describe(hackney_http, fun() ->
  describe(parse_response_version, fun() ->

    before(
      fun() ->
               let(response, <<"HTTP/1.1 200 OK">>),
               let(status, #hparser{ }) end.
    ),

    before(
      fun() -> let(response, <<"HTTP/1.1 200 OK">>),
               let(status, #hparser{ }) end.),

    it("returns a correct response",
       fun() -> { response, _Response, Status_code } = hackney_http:parse_response_version(get(response), get(status)),
                ?expect_to_eq(Status_code, 200) end),

    it("returns a correct response", fun() ->
      { response, _Response, Status_code } = hackney_http:parse_response_version(get(response), get(status)),
      ?expect_to_eq(Status_code, 200).
    end.),

    before({tags, positive}, fun before_actions:set_response/0),

    it("returns a correct response", fun expectations:correct_response/2, {status_code, 200}, {tags, {positive}}),

    it("returns a correct response",
       fun expectations:correct_response/2,
       {status_code, 200}, {tags, {positive}})
  end.
end).

git(commit).
git(status).

# type Status_code    :: 200 | 400
# type Status_message :: "Resource found!" | "Resource not found!"
# type Response       :: { :status, Status_code, Status_message } | { :status, Status_code, Status_message }
# type Result         :: { :ok, Status_message }  | { :error, Status_message }
#
# result :: Response -> Result
# let result response = match response with
#   | { :status, 200, msg } -> { :ok, msg }
#   | { :status, 400, msg } -> { :error, msg }
