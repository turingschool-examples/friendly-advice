class AdviceGenerator

  def message
    generate_advice[:slip][:advice]
  end

  private
    def advice_service
       AdviceService.new
    end

    def generate_advice
      advice_service.advice_info
    end
end
