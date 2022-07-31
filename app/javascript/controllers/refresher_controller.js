import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="refresher"
export default class extends Controller {
  static targets = ["form"]
  connect() {
  }

  search() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.formTarget.requestSubmit()
    }, 800)
  }
}
