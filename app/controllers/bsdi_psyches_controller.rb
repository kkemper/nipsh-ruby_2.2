class BsdiPsychesController < InheritedResources::Base

  private

    def bsdi_psych_params
      params.require(:bsdi_psych).permit(:bsdi_report_id, :bsdi_psych_overall, :bsdi_life_satisfaction, :bsdi_satisfaction_job, :bsdi_stress_level, :bsdi_psych_stress_effect, :bsdi_sleep, :bsdi_insufficient_sleep, :bsdi_friends, :bsdi_social_ties, :bsdi_spirit_health)
    end
end

