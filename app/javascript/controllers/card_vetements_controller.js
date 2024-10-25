import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["imageContainer"];

  connect() {
    console.log("Card Vêtements Controller is connected.");

    // Configuration des images par couleur
    this.imagesByColor = {
      blue: [
        "https://plus.unsplash.com/premium_photo-1663127357106-fbd8a835e07f?q=80&w=2344&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1495105787522-5334e3ffa0ef?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1614446213011-55a93c1311f5?q=80&w=2266&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1466193341027-56e68017ee2d?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        // Ajoutez d'autres images bleues ici
      ],
      green: [
        "https://images.unsplash.com/photo-1700853012811-ce0a42d2b6d3?q=80&w=2671&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1512990414788-d97cb4a25db3?q=80&w=1415&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1523380677598-64d85d015339?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://plus.unsplash.com/premium_photo-1723900969508-5475a3aabb62?q=80&w=2338&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        // Ajoutez d'autres images vertes ici
      ],
      red: [
        "https://images.unsplash.com/flagged/photo-1572516650129-aeb4bc71b579?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1511511450040-677116ff389e?q=80&w=2346&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1605306083141-3cca30078186?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1608096299210-db7e38487075?q=80&w=2338&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        // Ajoutez d'autres images rouges ici
      ],
      pink: [
        "https://images.unsplash.com/photo-1534445162008-f383d5d42061?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1554669776-35739b664f22?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1571117548864-bfcaa25161c9?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "https://images.unsplash.com/photo-1616249136282-b8675d07a780?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",

        // Ajoutez d'autres images roses ici
      ]
    };
  }

  changeColor(event) {
    const color = event.currentTarget.getAttribute("data-vetements-color");
    console.log(`Couleur sélectionnée : ${color}`); // Log pour vérifier la couleur sélectionnée

    const images = this.imagesByColor[color];
    if (images) {
      this.updateMosaic(images);
      console.log(`Images mises à jour pour la couleur : ${color}`); // Log pour confirmer la mise à jour des images
    } else {
      console.log(`Aucune image trouvée pour la couleur : ${color}`); // Log pour les cas où aucune image n'est trouvée
    }
  }

  updateMosaic(images) {
    this.imageContainerTarget.innerHTML = `<div class="image-wrapper">` +images
      .map(src => `<img src="${src}" alt="Image de couleur ${src}" class="img-fluid vetements-image">`)
      .join("") + `</div>`;
    console.log("Mosaïque mise à jour avec de nouvelles images."); // Log pour confirmer que la mosaïque est mise à jour
  }
}
