module Api
  module V1
    class RunnersController < ApplicationController
      # protect_from_forgery with: :null_session

      def index
        render json: RunnerSerializer.new(Runner.scan).serializable_hash
        # render json: RunnerSerializer.new(Runner.locallegends).serializable_hash
      end

      def show
        runner = Runner.find(id: params['id'].to_i)
        render json: RunnerSerializer.new(runner).serializable_hash
      end
    end
  end
end
