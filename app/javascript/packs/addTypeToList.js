const typesContainer = document.querySelector(".TypesContainer")
const addItemButton = document.querySelector("#addItemToList");
let listItemIdx = 0;

const materials = ["Metal","Glass","Plastic"]


const generateDomElement = (type, className = null) => {

    const element = document.createElement(type);

    if (className) {
        element.className = className;
    }

    return element;
}

// event handler for RemoveBtn
let removeContainer = (e) => { 
    // prevent the form from being submitted
    e.preventDefault(); 
    let tyContainer = e.target.parentNode

    // only when the current items list have more than 1 item, that we allow deletion of items
    if (tyContainer.parentNode.childElementCount > 1 ) 
        tyContainer.parentNode.removeChild(tyContainer)
}

const generateTypeInputForm = (index) => {

    // create wrapper container
    const typeInputContainerEl = generateDomElement("div","TypeInputContainer");


    // create material inputs
    const materialInputContainerEl = generateDomElement("div", "MaterialInputs");

    for (const material of materials) {
        const inputEl = generateDomElement("input")
        inputEl.type = "radio"
        // *** from ... commented for now, pending Elisa...
        // inputEl.value = `{:value=>&quot;${material}&quot;}`

        // *** to...
        inputEl.value = `${material}`
        inputEl.name = `list[types_attributes][${index}][material]`
        
        materialInputContainerEl.appendChild(inputEl);

        const labelEl = generateDomElement("label");
        labelEl.innerText = material;

        materialInputContainerEl.appendChild(labelEl);
    
    }
    // by default the first material is chosen
    materialInputContainerEl.childNodes[0].checked = true 

    typeInputContainerEl.appendChild(materialInputContainerEl);

    // create remarks input

    const remarkContainerEl = generateDomElement("div","RemarksInput")

    const remarksLabelEl = generateDomElement("label");
    remarksLabelEl.innerText = "Remarks"

    remarkContainerEl.appendChild(remarksLabelEl);

    const remarkInputEl = generateDomElement("input");
    remarkInputEl.type = "text"
    remarkInputEl.name = `list[types_attributes][${index}][remarks]`

    remarkContainerEl.appendChild(remarkInputEl);

    materialInputContainerEl.appendChild(remarkContainerEl)
    
    // create weight input

    const weightContainerEl = generateDomElement("div","WeightInput")

    const weightLabelEl = generateDomElement("label");
    weightLabelEl.innerText = "Weight(KG)"

    weightContainerEl.appendChild(weightLabelEl);

    const weightInputEl = generateDomElement("input");
    weightInputEl.type = "number"
    weightInputEl.name = `list[types_attributes][${index}][weight]`
    weightInputEl.step = "0.1"
    weightInputEl.min="0.1"
    weightInputEl.max="10"

    weightContainerEl.appendChild(weightInputEl);

    // Adding remove button
    const removeBtn = generateDomElement("button")
    removeBtn.textContent = "Remove"
    removeBtn.addEventListener('click', removeContainer)
    // end remove button

    materialInputContainerEl.appendChild(weightContainerEl);
    typeInputContainerEl.appendChild(removeBtn)
    
    typesContainer.appendChild(typeInputContainerEl);
}

addItemButton.addEventListener("click", (e)=>{
    e.preventDefault();
    generateTypeInputForm(listItemIdx++);
})

generateTypeInputForm(listItemIdx++);
