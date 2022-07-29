import { Controller } from "@hotwired/stimulus"
import { Input } from "postcss"

// Connects to data-controller="refresher"
export default class extends Controller {
  static targets = ["input", "results"]
  connect() {
    // console.log(this.element)
  }
}
