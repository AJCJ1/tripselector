import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="activity"
export default class extends Controller {
  static targets = ['activity', 'symbol']
  connect() {
  }

  showDescription(event) {
    const element = event.target
    const index = element.dataset.index

    if (this.activityTargets[index].style.display == "" || this.activityTargets[index].style.display == "none") {
      this.activityTargets[index].style.display = "inline"
      this.symbolTargets[index].classList.add("fa-caret-down")
      this.symbolTargets[index].classList.remove("fa-caret-up")
    } else if (this.activityTargets[index].style.display == "inline") {
      this.activityTargets[index].style.display = "none"
      this.symbolTargets[index].classList.add("fa-caret-up")
      this.symbolTargets[index].classList.remove("fa-caret-down")
    }
  }
}
