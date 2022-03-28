package com.WPF.domain;

public class PhysicalExam {
	private String pe_id;
	private String pe_u_id;
	private String pe_rl_id;
	private String pe_ra_id;
	private String pe_e_id;
	private int pe_body_temperature;
	private int pe_pulse;
	private int pe_blood_pressure;
	private int pe_skin;
	private int pe_lymph_nodes;
	private int pe_neck;
	private int pe_chest;
	private int pe_abdomen;
	private int pe_spine;
	private int pe_limbs;
	private String pe_other;
	private double pe_height;
	private double pe_weight;
	private int pe_ECG;
	private int pe_blood_routine;
	private int pe_urine_routine;
	private int pe_blood_chemistry;
	private int pe_coagulation;
	private int pe_pregnancy;
	private int pe_smoking;
	private int pe_drinking;

	public PhysicalExam() {
	}

	public PhysicalExam(String pe_id, String pe_u_id, String pe_rl_id, String pe_ra_id, String pe_e_id, int pe_body_temperature, int pe_pulse, int pe_blood_pressure, int pe_skin, int pe_lymph_nodes, int pe_neck, int pe_chest, int pe_abdomen, int pe_spine, int pe_limbs, String pe_other, double pe_height, double pe_weight, int pe_ECG, int pe_blood_routine, int pe_urine_routine, int pe_blood_chemistry, int pe_coagulation, int pe_pregnancy, int pe_smoking, int pe_drinking) {
		this.pe_id = pe_id;
		this.pe_u_id = pe_u_id;
		this.pe_rl_id = pe_rl_id;
		this.pe_ra_id = pe_ra_id;
		this.pe_e_id = pe_e_id;
		this.pe_body_temperature = pe_body_temperature;
		this.pe_pulse = pe_pulse;
		this.pe_blood_pressure = pe_blood_pressure;
		this.pe_skin = pe_skin;
		this.pe_lymph_nodes = pe_lymph_nodes;
		this.pe_neck = pe_neck;
		this.pe_chest = pe_chest;
		this.pe_abdomen = pe_abdomen;
		this.pe_spine = pe_spine;
		this.pe_limbs = pe_limbs;
		this.pe_other = pe_other;
		this.pe_height = pe_height;
		this.pe_weight = pe_weight;
		this.pe_ECG = pe_ECG;
		this.pe_blood_routine = pe_blood_routine;
		this.pe_urine_routine = pe_urine_routine;
		this.pe_blood_chemistry = pe_blood_chemistry;
		this.pe_coagulation = pe_coagulation;
		this.pe_pregnancy = pe_pregnancy;
		this.pe_smoking = pe_smoking;
		this.pe_drinking = pe_drinking;
	}

	public String getPe_id() {
		return pe_id;
	}

	public void setPe_id(String pe_id) {
		this.pe_id = pe_id;
	}

	public String getPe_u_id() {
		return pe_u_id;
	}

	public void setPe_u_id(String pe_u_id) {
		this.pe_u_id = pe_u_id;
	}

	public String getPe_rl_id() {
		return pe_rl_id;
	}

	public void setPe_rl_id(String pe_rl_id) {
		this.pe_rl_id = pe_rl_id;
	}

	public String getPe_ra_id() {
		return pe_ra_id;
	}

	public void setPe_ra_id(String pe_ra_id) {
		this.pe_ra_id = pe_ra_id;
	}

	public String getPe_e_id() {
		return pe_e_id;
	}

	public void setPe_e_id(String pe_e_id) {
		this.pe_e_id = pe_e_id;
	}

	public int getPe_body_temperature() {
		return pe_body_temperature;
	}

	public void setPe_body_temperature(int pe_body_temperature) {
		this.pe_body_temperature = pe_body_temperature;
	}

	public int getPe_pulse() {
		return pe_pulse;
	}

	public void setPe_pulse(int pe_pulse) {
		this.pe_pulse = pe_pulse;
	}

	public int getPe_blood_pressure() {
		return pe_blood_pressure;
	}

	public void setPe_blood_pressure(int pe_blood_pressure) {
		this.pe_blood_pressure = pe_blood_pressure;
	}

	public int getPe_skin() {
		return pe_skin;
	}

	public void setPe_skin(int pe_skin) {
		this.pe_skin = pe_skin;
	}

	public int getPe_lymph_nodes() {
		return pe_lymph_nodes;
	}

	public void setPe_lymph_nodes(int pe_lymph_nodes) {
		this.pe_lymph_nodes = pe_lymph_nodes;
	}

	public int getPe_neck() {
		return pe_neck;
	}

	public void setPe_neck(int pe_neck) {
		this.pe_neck = pe_neck;
	}

	public int getPe_chest() {
		return pe_chest;
	}

	public void setPe_chest(int pe_chest) {
		this.pe_chest = pe_chest;
	}

	public int getPe_abdomen() {
		return pe_abdomen;
	}

	public void setPe_abdomen(int pe_abdomen) {
		this.pe_abdomen = pe_abdomen;
	}

	public int getPe_spine() {
		return pe_spine;
	}

	public void setPe_spine(int pe_spine) {
		this.pe_spine = pe_spine;
	}

	public int getPe_limbs() {
		return pe_limbs;
	}

	public void setPe_limbs(int pe_limbs) {
		this.pe_limbs = pe_limbs;
	}

	public String getPe_other() {
		return pe_other;
	}

	public void setPe_other(String pe_other) {
		this.pe_other = pe_other;
	}

	public double getPe_height() {
		return pe_height;
	}

	public void setPe_height(double pe_height) {
		this.pe_height = pe_height;
	}

	public double getPe_weight() {
		return pe_weight;
	}

	public void setPe_weight(double pe_weight) {
		this.pe_weight = pe_weight;
	}

	public int getPe_ECG() {
		return pe_ECG;
	}

	public void setPe_ECG(int pe_ECG) {
		this.pe_ECG = pe_ECG;
	}

	public int getPe_blood_routine() {
		return pe_blood_routine;
	}

	public void setPe_blood_routine(int pe_blood_routine) {
		this.pe_blood_routine = pe_blood_routine;
	}

	public int getPe_urine_routine() {
		return pe_urine_routine;
	}

	public void setPe_urine_routine(int pe_urine_routine) {
		this.pe_urine_routine = pe_urine_routine;
	}

	public int getPe_blood_chemistry() {
		return pe_blood_chemistry;
	}

	public void setPe_blood_chemistry(int pe_blood_chemistry) {
		this.pe_blood_chemistry = pe_blood_chemistry;
	}

	public int getPe_coagulation() {
		return pe_coagulation;
	}

	public void setPe_coagulation(int pe_coagulation) {
		this.pe_coagulation = pe_coagulation;
	}

	public int getPe_pregnancy() {
		return pe_pregnancy;
	}

	public void setPe_pregnancy(int pe_pregnancy) {
		this.pe_pregnancy = pe_pregnancy;
	}

	public int getPe_smoking() {
		return pe_smoking;
	}

	public void setPe_smoking(int pe_smoking) {
		this.pe_smoking = pe_smoking;
	}

	public int getPe_drinking() {
		return pe_drinking;
	}

	public void setPe_drinking(int pe_drinking) {
		this.pe_drinking = pe_drinking;
	}

	@Override
	public String toString() {
		return "PhysicalExam{" +
				"pe_id='" + pe_id + '\'' +
				", pe_u_id='" + pe_u_id + '\'' +
				", pe_rl_id='" + pe_rl_id + '\'' +
				", pe_ra_id='" + pe_ra_id + '\'' +
				", pe_e_id='" + pe_e_id + '\'' +
				", pe_body_temperature=" + pe_body_temperature +
				", pe_pulse=" + pe_pulse +
				", pe_blood_pressure=" + pe_blood_pressure +
				", pe_skin=" + pe_skin +
				", pe_lymph_nodes=" + pe_lymph_nodes +
				", pe_neck=" + pe_neck +
				", pe_chest=" + pe_chest +
				", pe_abdomen=" + pe_abdomen +
				", pe_spine=" + pe_spine +
				", pe_limbs=" + pe_limbs +
				", pe_other='" + pe_other + '\'' +
				", pe_height=" + pe_height +
				", pe_weight=" + pe_weight +
				", pe_ECG=" + pe_ECG +
				", pe_blood_routine=" + pe_blood_routine +
				", pe_urine_routine=" + pe_urine_routine +
				", pe_blood_chemistry=" + pe_blood_chemistry +
				", pe_coagulation=" + pe_coagulation +
				", pe_pregnancy=" + pe_pregnancy +
				", pe_smoking=" + pe_smoking +
				", pe_drinking=" + pe_drinking +
				'}';
	}
}
