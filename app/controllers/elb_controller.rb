# frozen_string_literal: true

class ElbController < ActionController::Base
  def healthcheck
    render plain: "ok"
  end
end
