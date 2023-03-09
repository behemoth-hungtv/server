module Errors
  module ExecutionError
    def execution_error(type, errors, status: :unprocessable_entity)
      render json: { type:, errors: }, status:
    end
  end
end
