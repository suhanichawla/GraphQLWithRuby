
class Mutations::CreatePost < Mutations::BaseMutation
    argument :title, String, required: true
    argument :body, String, required: true
    argument :user, Integer, required: true
    field :post, Types::PostType, null:false
    field :errors, [String], null:false

    def resolve(title:, body:, user:)
      @post =Post.new(title: title, body: body,user: User.find_by_id(user))

      if(@post.save)
        {
          post: @post,
          errors: []
        }else{
          post: nil,
          errors: @post.errors.full_messages
        }
      end
    end
end

