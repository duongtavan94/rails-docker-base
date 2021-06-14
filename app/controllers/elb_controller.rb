# frozen_string_literal: true

class ElbController < ActionController::Base
  def healthcheck
    render plain: "ok3"
  end
end
