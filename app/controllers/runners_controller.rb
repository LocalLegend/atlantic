class RunnersController < ApplicationController
  def index
    @runners = Runner.scan.map(&:to_h).sort_by { |r| r[:score] }
  end
end
