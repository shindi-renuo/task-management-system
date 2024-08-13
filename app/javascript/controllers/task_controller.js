// app/javascript/controllers/task_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["title", "description", "editButtons", "viewButtons", "taskDetails", "normalData"];

  edit() {
    this.viewButtonsTarget.classList.add('hidden');
    this.editButtonsTarget.classList.remove('hidden');
    this.normalDataTarget.classList.add('hidden');
  }

  save() {
    this.editButtonsTarget.classList.add('hidden');
    this.viewButtonsTarget.classList.remove('hidden');
  }

  delete(event) {
    if (!confirm(event.currentTarget.dataset.confirm)) {
      event.preventDefault();
    }
  }
}