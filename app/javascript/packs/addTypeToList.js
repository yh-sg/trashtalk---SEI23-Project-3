// const typesContainer = document.querySelector(".TypesContainer")

// Initialise 
let typeData = []

// get all the containers with the same class
const typesContainer = document.getElementsByClassName("TypesContainer")
const createListBtn = document.getElementById("submitBtn")
console.log(createListBtn)

// For edit form ===> We append all the data
// we need to add an if else for new form
$('.TypesContainer').each(function(){
    typeData.push(($(this).data('types')))
});

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

    if (typesContainer.length > 1)
        tyContainer.parentNode.remove()
}

const generateTypeInputForm = (index, container) => {

    // create wrapper container
    const typeInputContainerEl = generateDomElement("div","TypeInputContainer");

    // create material inputs
    const materialInputContainerEl = generateDomElement("div", "MaterialInputs");

    for (const material of materials) {
        const inputEl = generateDomElement("input")
        inputEl.type = "radio"
        inputEl.value = `${material}`
        inputEl.name = `list[types_attributes][${index}][material]`
        
        materialInputContainerEl.appendChild(inputEl);

        const labelEl = generateDomElement("label");
        labelEl.innerText = material;

        materialInputContainerEl.appendChild(labelEl);
    
    }

    if (typeData.length != 0) {
        let checkedButton = 0
        if (typeData[index] !== undefined) 
            checkedButton = materials.indexOf(typeData[index].material)
        
        if (checkedButton === 1)
            materialInputContainerEl.childNodes[2].checked = true 
        else if (checkedButton === 2) 
            materialInputContainerEl.childNodes[4].checked = true
        else 
            materialInputContainerEl.childNodes[0].checked = true 
    }
    else {
        materialInputContainerEl.childNodes[0].checked = true 
    }

    typeInputContainerEl.appendChild(materialInputContainerEl);

    // create remarks input
    const remarkContainerEl = generateDomElement("div","RemarksInput")

    const remarksLabelEl = generateDomElement("label");
    remarksLabelEl.innerText = "Remarks"

    remarkContainerEl.appendChild(remarksLabelEl);

    const remarkInputEl = generateDomElement("input");

    // >>> For edit form
    remarkInputEl.value = typeData[index] != undefined ? typeData[index].remarks : ""
    // end for edit form

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

    // >>> for Edit form 
    weightInputEl.value = typeData[index] != undefined ? typeData[index].weight : 0
    // end edit form 
    
    weightContainerEl.appendChild(weightInputEl);

    // Adding remove button
    const removeBtn = generateDomElement("button")
    removeBtn.textContent = "Remove"
    removeBtn.addEventListener('click', removeContainer)
    // end remove button

    materialInputContainerEl.appendChild(weightContainerEl);
    typeInputContainerEl.appendChild(removeBtn)
    
    if (container != undefined) {
        container.appendChild(typeInputContainerEl)
        document.querySelector("form").insertBefore(container, submitBtn)
    }
}

addItemButton.addEventListener("click", (e)=>{
    e.preventDefault();
    const container = generateDomElement("div", "TypesContainer")
    generateTypeInputForm(listItemIdx++, container);
})

for (let i = 0; i < typesContainer.length; i++) {
    generateTypeInputForm(listItemIdx++, typesContainer[i]);
}
