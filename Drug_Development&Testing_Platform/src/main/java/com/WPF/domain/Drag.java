package com.WPF.domain;

public class Drag {
	private String d_id;
	private String d_e_id;
	private String d_trade_name;
	private String d_generic_name;
	private String d_specification;
	private String d_manufacturer;
	private String d_batch_number;
	private String d_approval_number;
	private String d_attending;
	private String d_taboo;
	private String d_adverse_reactions;
	private String d_shelf_life;
	private int d_state;
	private int d_approve;
	private int d_mark;
	private String d_notes;
	private String d_ingredients;
	private String d_characters;
	private String d_interaction;
	private String d_pharmacological;
	public Drag() {
	}

	public Drag(String d_id, String d_e_id, String d_trade_name, String d_generic_name, String d_specification, String d_manufacturer, String d_batch_number, String d_approval_number, String d_attending, String d_taboo, String d_adverse_reactions, String d_shelf_life, int d_state, int d_approve, int d_mark, String d_notes, String d_ingredients, String d_characters, String d_interaction, String d_pharmacological) {
		this.d_id = d_id;
		this.d_e_id = d_e_id;
		this.d_trade_name = d_trade_name;
		this.d_generic_name = d_generic_name;
		this.d_specification = d_specification;
		this.d_manufacturer = d_manufacturer;
		this.d_batch_number = d_batch_number;
		this.d_approval_number = d_approval_number;
		this.d_attending = d_attending;
		this.d_taboo = d_taboo;
		this.d_adverse_reactions = d_adverse_reactions;
		this.d_shelf_life = d_shelf_life;
		this.d_state = d_state;
		this.d_approve = d_approve;
		this.d_mark = d_mark;
		this.d_notes = d_notes;
		this.d_ingredients = d_ingredients;
		this.d_characters = d_characters;
		this.d_interaction = d_interaction;
		this.d_pharmacological = d_pharmacological;
	}

	public String getD_id() {
		return d_id;
	}

	public void setD_id(String d_id) {
		this.d_id = d_id;
	}

	public String getD_e_id() {
		return d_e_id;
	}

	public void setD_e_id(String d_e_id) {
		this.d_e_id = d_e_id;
	}

	public String getD_trade_name() {
		return d_trade_name;
	}

	public void setD_trade_name(String d_trade_name) {
		this.d_trade_name = d_trade_name;
	}

	public String getD_generic_name() {
		return d_generic_name;
	}

	public void setD_generic_name(String d_generic_name) {
		this.d_generic_name = d_generic_name;
	}

	public String getD_specification() {
		return d_specification;
	}

	public void setD_specification(String d_specification) {
		this.d_specification = d_specification;
	}

	public String getD_manufacturer() {
		return d_manufacturer;
	}

	public void setD_manufacturer(String d_manufacturer) {
		this.d_manufacturer = d_manufacturer;
	}

	public String getD_batch_number() {
		return d_batch_number;
	}

	public void setD_batch_number(String d_batch_number) {
		this.d_batch_number = d_batch_number;
	}

	public String getD_approval_number() {
		return d_approval_number;
	}

	public void setD_approval_number(String d_approval_number) {
		this.d_approval_number = d_approval_number;
	}

	public String getD_attending() {
		return d_attending;
	}

	public void setD_attending(String d_attending) {
		this.d_attending = d_attending;
	}

	public String getD_taboo() {
		return d_taboo;
	}

	public void setD_taboo(String d_taboo) {
		this.d_taboo = d_taboo;
	}

	public String getD_adverse_reactions() {
		return d_adverse_reactions;
	}

	public void setD_adverse_reactions(String d_adverse_reactions) {
		this.d_adverse_reactions = d_adverse_reactions;
	}

	public String getD_shelf_life() {
		return d_shelf_life;
	}

	public void setD_shelf_life(String d_shelf_life) {
		this.d_shelf_life = d_shelf_life;
	}

	public int getD_state() {
		return d_state;
	}

	public void setD_state(int d_state) {
		this.d_state = d_state;
	}

	public int getD_approve() {
		return d_approve;
	}

	public void setD_approve(int d_approve) {
		this.d_approve = d_approve;
	}

	public int getD_mark() {
		return d_mark;
	}

	public void setD_mark(int d_mark) {
		this.d_mark = d_mark;
	}

	public String getD_notes() {
		return d_notes;
	}

	public void setD_notes(String d_notes) {
		this.d_notes = d_notes;
	}

	public String getD_ingredients() {
		return d_ingredients;
	}

	public void setD_ingredients(String d_ingredients) {
		this.d_ingredients = d_ingredients;
	}

	public String getD_characters() {
		return d_characters;
	}

	public void setD_characters(String d_characters) {
		this.d_characters = d_characters;
	}

	public String getD_interaction() {
		return d_interaction;
	}

	public void setD_interaction(String d_interaction) {
		this.d_interaction = d_interaction;
	}

	public String getD_pharmacological() {
		return d_pharmacological;
	}

	public void setD_pharmacological(String d_pharmacological) {
		this.d_pharmacological = d_pharmacological;
	}

	@Override
	public String toString() {
		return "Drag{" +
				"d_id='" + d_id + '\'' +
				", d_e_id='" + d_e_id + '\'' +
				", d_trade_name='" + d_trade_name + '\'' +
				", d_generic_name='" + d_generic_name + '\'' +
				", d_specification='" + d_specification + '\'' +
				", d_manufacturer='" + d_manufacturer + '\'' +
				", d_batch_number='" + d_batch_number + '\'' +
				", d_approval_number='" + d_approval_number + '\'' +
				", d_attending='" + d_attending + '\'' +
				", d_taboo='" + d_taboo + '\'' +
				", d_adverse_reactions='" + d_adverse_reactions + '\'' +
				", d_shelf_life='" + d_shelf_life + '\'' +
				", d_state=" + d_state +
				", d_approve=" + d_approve +
				", d_mark=" + d_mark +
				", d_notes='" + d_notes + '\'' +
				", d_ingredients='" + d_ingredients + '\'' +
				", d_characters='" + d_characters + '\'' +
				", d_interaction='" + d_interaction + '\'' +
				", d_pharmacological='" + d_pharmacological + '\'' +
				'}';
	}
}
