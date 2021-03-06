json.array!(@ohm_pfts) do |ohm_pft|
  json.extract! ohm_pft, :id, :moddate, :ssn, :ohm_height, :ohm_weight, :ohm_bp, :ohm_fvc, :ohm_fev1, :ohm_fev1fvc, :ohm_fvcpr, :ohm_fev1pr
  json.url ohm_pft_url(ohm_pft, format: :json)
end
