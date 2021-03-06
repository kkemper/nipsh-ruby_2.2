class BsdiDietsController < InheritedResources::Base

  private

    def bsdi_diet_params
      params.require(:bsdi_diet).permit(:bsdi_report_id, :bsdi_breakfast, :bsdi_fruits, :bsdi_vegetables, :bsdi_grains, :bsdi_grain_emphasis, :bsdi_red_meat, :bsdi_lean_meat, :bsdi_dairy, :bsdi_dairy_emphasis, :bsdi_fats_and_oils, :bsdi_nutrition_status, :bsdi_nut_missing_values)
    end
end

