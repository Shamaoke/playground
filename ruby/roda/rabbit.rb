

class ForumId < Integer; end

class Forum; end

class ForumPath; end

class Router < Roda
  route do |r|
    r.on 'forums', ForumId, &ForumController.method(:get)

    # r.on 'forums', ForumId do |id|
    #   forum = Forum.get id
    #   unless forum.allow_access? current_user_id
    #     response.status = 403
    #     r.halt
    #   end
    # end
  end
end

